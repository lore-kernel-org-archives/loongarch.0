Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8944F85A5;
	Mon, 19 Oct 2026 13:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415371; cv=none; b=IDy/BcgJqKPSBwOQwPmAvG/vu1lz8nCB/JEJYyu2pY2ksKRo/SCVWtnWIB1OT/K76hkwXAqzEehQWjdkfmJ6WGDqGWi5LCQoMHZngL6mEGTVwVpwhNGSn6ZHlU2MT5WkFb6q6NU4wQycZ02ROkHMed6ZKdQjvFbnZfGCZFq9vqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415371; c=relaxed/simple;
	bh=Utnpvdca2ld45brPZnbhWXKaUoebuFSR0e/DoKYLf1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NpN5JC9qdwnoqhwpPUKI2xLlo7TkjTScLv4Nhzzugmnl2fCOy2XbV5uMBulKEKWjmuBd9z4Q8EvjtqF1cS+eXpsU48fXgVJtArYTSjLrd/ePB37I5PHbUrLfal2pWR7gKyHUO4hPjneTbqXdxyV0ktnMY/ZU+o4tDdHtPhpiqt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lT1v1BTD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lT1v1BTD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45B31F000C5;
	Mon, 19 Oct 2026 13:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415370;
	bh=ACXR4c/mJG0yyltIesQbqalC0iUpeF1uXq6xWutv6LU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lT1v1BTDSYJKHRFHDJ2wGYaBX5Vwm7bKsSRA/2YXcn9sYNGNsmlmvLKagoizaS8GT
	 XDuATyFV9h5pg6lBj5NqsEv7LLVZDna20vI4lPjBA0A4eBlpEmqwMVMxAqI9Z7Ja0M
	 V/rB/ESm1nX12FaKKuqOdOPITZO+9cerseKaPYkrFZ/DRMWETCKTY39iLsmOi/JuPf
	 lRlWPflQzWRra5ez8qypSiT3ssjZ3oEFHP0oimSY6F8l42AhghZcNDdGUMBi4ItiZQ
	 4XUoRp4GwprtHbMJrWH+oG4wJBctUvaVL1ML+DKvoy5pd4MREjl29qGjeGJn+4rub2
	 9TCqQyF13d7Zg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Radu Rendec <radu@rendec.net>,
	Thomas Gleixner <tglx@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Waiman Long <longman@redhat.com>,
	loongarch@lists.linux.dev
Subject: [RFC PATCH 09/49] irqchip/loongarch-avec: Move CPUHP_AP_IRQ_AVECINTC_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:16 +0200
Message-ID: <20261019130856.49711-10-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019130856.49711-1-frederic@kernel.org>
References: <20261019130856.49711-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while stopping all CPUs in the system. This
doesn't mix-up well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

avecintc_cpu_offline() can run concurrently with other CPUs because
loongarch_avec.vector_matrix protects the internal structures.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 126896b2c970..f32404821731 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_EIOINTC_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_IRQ_AVECINTC_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_IRQ_EIOINTC_STARTING);
+	WARN_ON(st->state != CPUHP_AP_IRQ_AVECINTC_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

