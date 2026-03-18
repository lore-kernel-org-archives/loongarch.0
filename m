Received: from mx-2023-1.gwdg.de (mx-2023-1.gwdg.de [134.76.10.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EDB3EC2EB;
	Wed, 18 Mar 2026 15:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.76.10.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773849311; cv=none; b=DPnl9cROL9TJzTnfz2xlYZpwkFFrxNTM0gg3HxJeJ2UWOtJ2w/g8FhPAXiHJu/Lte8q/dFftFZU1ttxD/XazWq32hIQbAT1A0sQCnPYbrz7YYcNlXgl/T2MIzUn9DNoRIhtIJ5Bypu9lRA6ev+6RQldlYO7ILO+gOZAms9niEcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773849311; c=relaxed/simple;
	bh=Ccj7uU/hgogvAAnwRzXyWCy2N+zdHOpB+0udJVr6c+M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EhVytYe4rPgOp7A9rgNn5AVllaMOSBbJablvW+60Rx/cy5QkA3oy7ICGbwH97aNOMXD5s3euuKPZ2SzWVuIMXTnC09cVUjwutXjfzZtKURhWYqUSp3EjWtxmhhZit8TCX7Rk9SJqG5+5yK3Y1GBPHXUmjvtxPRohVf2Ps1PnKLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cispa.de; spf=pass smtp.mailfrom=cispa.de; dkim=pass (2048-bit key) header.d=cispa.de header.i=@cispa.de header.b=rWsT4cC6; arc=none smtp.client-ip=134.76.10.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cispa.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cispa.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cispa.de header.i=@cispa.de header.b="rWsT4cC6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cispa.de;
	s=2023-rsa; h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=cvGeMvE9YnClpQPYErkfU70z9HT5KgRZdjo4pOsDJLc=; b=rWsT4cC6edBc1LpKfKTnVgLV5y
	6bpC9KLoJ/W04ipiU0zsPblden+aX/ZN9d55IqlKy/vtFB4qKxlJYdCrc3msXfZ1g0LXyht3KqOrm
	c/RaG1RCqsO21vcX5PsN+4T5ZCcEGIzOn7ljmmJZt61msWwtvg6RzJdyrJ2nlsehpNibBQdovW7Tl
	NeA1eOgaH/RAryJLUGGvwcWS/5wG89loT+xRwfJaL8JBhsI3uw/9lcLMW5q4uWauuZP7tRxXa/NpI
	rCFhlhY6vhP3YyV4ryRes7i4hCuno3plMjJ7q9L0yX2hjAXp6455Iju5vvy/lGVPjrMmJBHibxsTn
	lT8NAavQ==;
Received: from mailer.gwdg.de ([134.76.10.26]:60256)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <lorenz.hetterich@cispa.de>)
	id 1w2sfG-00EBLl-01;
	Wed, 18 Mar 2026 16:18:30 +0100
Received: from mbx19-sub-04.um.gwdg.de ([10.108.142.69] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lorenz.hetterich@cispa.de>)
	id 1w2sfG-0002oJ-24;
	Wed, 18 Mar 2026 16:18:30 +0100
Received: from Laptop.fritz.box (10.250.9.200) by MBX19-SUB-04.um.gwdg.de
 (10.108.142.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.37; Wed, 18 Mar
 2026 16:18:30 +0100
From: Lorenz Hetterich <lorenz.hetterich@cispa.de>
To: <chenhuacai@kernel.org>
CC: <loongarch@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Lorenz
 Hetterich <lorenz.hetterich@cispa.de>
Subject: [PATCH 0/2] Fix issues in LoongArch page fault handling
Date: Wed, 18 Mar 2026 16:18:19 +0100
Message-ID: <20260318151821.190439-1-lorenz.hetterich@cispa.de>
X-Mailer: git-send-email 2.43.0
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

This patch series addresses two issues in LoongArch page fault handling.

First, the page fault handler calls kprobe_page_fault
with the current thread's trap_nr.
However, the thread's trap number is not updated prior
to the call leading to a stale value being used.

Second, the page fault handler never sets the FAULT_FLAG_INSTRUCTION flag.
This means architecture-independent linux code like
handle_mm_fault cannot distinguish between read and execute faults.
While this does not seem to cause immediate problems,
it is inconsistent with other architectures like x86, arm64, and riscv.

Signed-off-by: Lorenz Hetterich <lorenz.hetterich@cispa.de>

Lorenz Hetterich (2):
  Loongarch: Fix stale value in __do_page_fault()
  LoongArch: Set FAULT_FLAG_INSTRUCTION in __do_page_fault()

 arch/loongarch/include/asm/exception.h | 3 +++
 arch/loongarch/mm/fault.c              | 4 ++++
 2 files changed, 7 insertions(+)

-- 
2.43.0

