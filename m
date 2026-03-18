Received: from mx-2023-1.gwdg.de (mx-2023-1.gwdg.de [134.76.10.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E2127467F;
	Wed, 18 Mar 2026 15:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.76.10.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773847907; cv=none; b=gQF2JsZD/SUhFK5ME1J6TNVklVxNY2S1cuKJ5qQWkbcz8FgIOWtTLrfWb7g6E5LmZAeCgNQZeyWOwYcNBsIrzbrV86KSDhsqS9dsh2qgSQxwJ2so3s46Dnj3WtOTKzMQlDZaNzuJFIQ22tjNO/vfgOA05OdQfiJdBjulhBYUjt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773847907; c=relaxed/simple;
	bh=QJLkRDDkFPVr8xxFQQWBwVrygGNYPOZTFZMqkKJDhJg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rQp3uGPOWgVAjg3fZC3zvVOTWcbHu/RauBv+bEwIFLddf261S2iqyJXEKIZ/TPL6wCDebRFEgg71CFGVOfmWOxnMUqu3Pk5H1O0S4yWh5Ljj2kKgIcdrfM0QF5XoNqsNmABYl9I75KzyoU62XD2H5PJ1VfoHfC1/XxwtfypbtBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cispa.de; spf=pass smtp.mailfrom=cispa.de; dkim=pass (2048-bit key) header.d=cispa.de header.i=@cispa.de header.b=qgaNWjzF; arc=none smtp.client-ip=134.76.10.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cispa.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cispa.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cispa.de header.i=@cispa.de header.b="qgaNWjzF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cispa.de;
	s=2023-rsa; h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QIrVHzrxROtT8Pq+6qvTeJs6b7GJ1UExCjssaGtW86E=; b=qgaNWjzFS+LUx/PKP4mvgyKAGF
	e4VzLEdVYJZFkrKx9Gfmt7t/Z/2uRroYSLe9H+fsB3RCKj5O2ttcJP0NY4g3Jg45DLDec5HH7mkJw
	UoXwxj+rwieyimSf/P5Et4c/97d7WeuYwm4T96LqyTxzNk+cl8IaMSP81YvAIAI+bi4bUUVeIP1/h
	4hRoIKgen6tnL/6DbSPz2YGXGtYvIiU8XVZps+WAtSqc/hdgzn1ALf+vru1oydf3fPiW3J/BpsR05
	v3d0RHTJ7UtT1iygrw4Wf+JNujZKo3JFqSeQaFXlm3LWOmdVQZ3ISAR4DtkxjvmAIcbcm59Ym3edQ
	Jb87CP4w==;
Received: from mailer.gwdg.de ([134.76.10.26]:32839)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <lorenz.hetterich@cispa.de>)
	id 1w2sfI-00EBLp-29;
	Wed, 18 Mar 2026 16:18:33 +0100
Received: from mbx19-sub-04.um.gwdg.de ([10.108.142.69] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lorenz.hetterich@cispa.de>)
	id 1w2sfJ-0002pj-11;
	Wed, 18 Mar 2026 16:18:33 +0100
Received: from Laptop.fritz.box (10.250.9.200) by MBX19-SUB-04.um.gwdg.de
 (10.108.142.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.37; Wed, 18 Mar
 2026 16:18:32 +0100
From: Lorenz Hetterich <lorenz.hetterich@cispa.de>
To: <chenhuacai@kernel.org>
CC: <loongarch@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Lorenz
 Hetterich <lorenz.hetterich@cispa.de>
Subject: [PATCH 1/2] Loongarch: Fix stale value in __do_page_fault()
Date: Wed, 18 Mar 2026 16:18:20 +0100
Message-ID: <20260318151821.190439-2-lorenz.hetterich@cispa.de>
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

__do_page_fault() calls kprobe_page_fault without setting
current->thread.trap_nr first.
Hence, kprobe_page_fault is called with a stale trapnr.

Set current->thread.trap_nr before calling kprobe_page_fault.

Signed-off-by: Lorenz Hetterich <lorenz.hetterich@cispa.de>
---
 arch/loongarch/mm/fault.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/loongarch/mm/fault.c b/arch/loongarch/mm/fault.c
index 2c93d33356e5..c7703bdec4fc 100644
--- a/arch/loongarch/mm/fault.c
+++ b/arch/loongarch/mm/fault.c
@@ -182,6 +182,7 @@ static void __kprobes __do_page_fault(struct pt_regs *regs,
 	struct vm_area_struct *vma = NULL;
 	vm_fault_t fault;
 
+	current->thread.trap_nr = read_csr_excode();
 	if (kprobe_page_fault(regs, current->thread.trap_nr))
 		return;
 
-- 
2.43.0

