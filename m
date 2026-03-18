Received: from mx-2023-1.gwdg.de (mx-2023-1.gwdg.de [134.76.10.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A458221FCF;
	Wed, 18 Mar 2026 15:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.76.10.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848043; cv=none; b=WdqWM24ZXayhwWmhGxrnFfk4bA5Ba4DhxbkZjku7wWT+Pav3ZQZn6FCov87X6LR0F7W57OuxpcbbZEDGULieLkzJLqjH9p/yeD5RG/J8k6e0fDdnHA5H1+TzvO2Gh1rN8jT69SIbbB8h6kf8yUJ5S8mTBiBEGQ9Li2WN9mIA0o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848043; c=relaxed/simple;
	bh=2VYZh10G4BsxiNJhnN+LaPNaIEsCE1jsrWHgRM0Cvzo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D/jKORyNCQOjdpBIoAMSzdXyA1zB4+M4SOjWm/yBsAnjYfKljbhPxHMKcQi+RP8Y0Mt7HG4scDVqWLUIs0tkhVPadRPClZfFnYv52ZH8+cHP6dpGqBnxI2WOt3Fw7g8B8tOa37KC7Yi48J/Z3kh9GM9g/CkjT0I0gYHabmKbXvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cispa.de; spf=pass smtp.mailfrom=cispa.de; dkim=pass (2048-bit key) header.d=cispa.de header.i=@cispa.de header.b=nwakXzrI; arc=none smtp.client-ip=134.76.10.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cispa.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cispa.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cispa.de header.i=@cispa.de header.b="nwakXzrI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cispa.de;
	s=2023-rsa; h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=cFS8GEOh5cZMK+HPrSZ4l1HG5B4wDp9OAYc2cdFTjbQ=; b=nwakXzrIU5MYROr0BJ3v6nJPua
	r5ONL1zqPSnDVIojjeL89m7SvoDrWs0/7fJwmrAib3DLBx1LDD7/bAEgnEgNpySbr6comrIzhzK0m
	rWss6h5WRq2iJWhCyVQOSdFrMdLVidJUhjOVS+EogVST/Hixi6+w6M3DokgSv13lt2Ei2d0SqBByJ
	4h1D4VpBUf8TjCxccIbn1gSZpZquHDBsYV27PIMgwsZ2TslTAx6TYWb/jwzK6DArilz6fqnaVQmvH
	bdrPhnykDQnui2sSJRIH3eTUBwUW6N0PbRPJoNB2RvvrKeQ4r/kWP5gK4DMNEPigN+YQx0TnTz3Gm
	0MKKUZFA==;
Received: from mailer.gwdg.de ([134.76.10.26]:59197)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <lorenz.hetterich@cispa.de>)
	id 1w2sfJ-00EBLt-3B;
	Wed, 18 Mar 2026 16:18:34 +0100
Received: from mbx19-sub-04.um.gwdg.de ([10.108.142.69] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lorenz.hetterich@cispa.de>)
	id 1w2sfK-0002qU-23;
	Wed, 18 Mar 2026 16:18:34 +0100
Received: from Laptop.fritz.box (10.250.9.200) by MBX19-SUB-04.um.gwdg.de
 (10.108.142.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.37; Wed, 18 Mar
 2026 16:18:34 +0100
From: Lorenz Hetterich <lorenz.hetterich@cispa.de>
To: <chenhuacai@kernel.org>
CC: <loongarch@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Lorenz
 Hetterich <lorenz.hetterich@cispa.de>
Subject: [PATCH 2/2] LoongArch: Set FAULT_FLAG_INSTRUCTION in __do_page_fault()
Date: Wed, 18 Mar 2026 16:18:21 +0100
Message-ID: <20260318151821.190439-3-lorenz.hetterich@cispa.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318151821.190439-1-lorenz.hetterich@cispa.de>
References: <20260318151821.190439-1-lorenz.hetterich@cispa.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MBX19-GWD-03.um.gwdg.de (10.108.142.56) To
 MBX19-SUB-04.um.gwdg.de (10.108.142.69)
X-Virus-Scanned: (clean) by clamav
X-Spam-Level: -

The page-fault handler never sets the FAULT_FLAG_INSTRUCTION flag.

Set FAULT_FLAG_INSTRUCTION for faults related to instruction fetches.

Signed-off-by: Lorenz Hetterich <lorenz.hetterich@cispa.de>
---
 arch/loongarch/include/asm/exception.h | 3 +++
 arch/loongarch/mm/fault.c              | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/loongarch/include/asm/exception.h b/arch/loongarch/include/asm/exception.h
index c6d20736fd92..7305b7065a43 100644
--- a/arch/loongarch/include/asm/exception.h
+++ b/arch/loongarch/include/asm/exception.h
@@ -6,6 +6,9 @@
 #include <asm/ptrace.h>
 #include <linux/kprobes.h>
 
+#define EXC_PIF	3  /* Page Invalid Fetch */
+#define EXC_PNX	6  /* Page Non-eXecutable */
+
 extern void *exception_table[];
 
 void show_registers(struct pt_regs *regs);
diff --git a/arch/loongarch/mm/fault.c b/arch/loongarch/mm/fault.c
index c7703bdec4fc..7cd422c1224e 100644
--- a/arch/loongarch/mm/fault.c
+++ b/arch/loongarch/mm/fault.c
@@ -215,6 +215,9 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 	if (user_mode(regs))
 		flags |= FAULT_FLAG_USER;
 
+	if (current->thread.trap_nr == EXC_PIF || current->thread.trap_nr == EXC_PNX)
+		flags |= FAULT_FLAG_INSTRUCTION;
+
 	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
 
 	if (!(flags & FAULT_FLAG_USER))
-- 
2.43.0

