Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FA95012BE;
	Mon, 19 Oct 2026 13:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792415434; cv=none; b=E714BPfmJ4FpUPQIbXqm81pj9rLV6vgwZVhL5guucHPrgDvGndk3CufmC5fNcLFMsm6FvykLUcUUXi11l/ATdBhY+6cERZTIp55QenyOb5AWkhsjHEjyU6KGtWwIxxAfYMoqK/I2/tHCHSTweo9nzncnuZc6NLWly5ZXtDsDAqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792415434; c=relaxed/simple;
	bh=cOFMTZ9UD7et+hx6VFm+A94x8pn2pk+SotAZL4M7UEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cmcWcyq87tZBVxR7yrOj5pabEwts4GutLoMJSMA4r8FrNWcBJPNiQ5sH7eDnGHlUY/YtxixAN85LckOGTBKJ8YO40pvSFl30WaKDHigDPCg4A1iopO5GYXRk/6bi/tf2CC2HFVbuk8wK9hMDhLEwISG2VGQuCY4czU6kDoxttqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DV+mFgFV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DV+mFgFV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647D81F000C6;
	Mon, 19 Oct 2026 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792415433;
	bh=t7XlK6cfxGRTky4P49u0Q2RlmiycoMBbsrwhU1sBfXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DV+mFgFVpqVBbRQ7Ea0Peq6j4cChM/XOSB0oHoOVbivzB+aM1NQvvlFXoq9YXWNWb
	 Yx+70n7Z5qSwtvGElYOouKrem3W99hpe69tG/Up13id5bNKYDWwAG30ooduyHVb1ly
	 OsM9FjSf8jugdpKf/4oRFjvvyxvaOgyWlVnLOlNwlq3SDB95Xadd00jGNNWwrjuwnL
	 pDigatwQ0OmwBZD0pslA27pG936E4Z8PUELJmdNilFF+O5x0DJkB08+pAJyWGmipbo
	 m30P7lHK1jl5oiou67OGhj4Pbi+c4uorehU/v/45bmiCir1Xmw4oHhRPV8gqf8TJ22
	 86dgwPf8ildIA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Arnd Bergmann <arnd@arndb.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Waiman Long <longman@redhat.com>,
	loongarch@lists.linux.dev
Subject: [RFC PATCH 31/49] LoongArch: Move CPUHP_AP_LOONGARCH_ARCH_TIMER_STARTING post stop_machine()
Date: Mon, 19 Oct 2026 15:08:38 +0200
Message-ID: <20261019130856.49711-32-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019130856.49711-1-frederic@kernel.org>
References: <20261019130856.49711-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while stopping all CPUs in the system. This
doesn't mix-up well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The teardown callback here simply clears the interrupt on the CSR,
operation that can run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index daad3b496854..664831c50f0b 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -1275,7 +1275,7 @@ void clear_tasks_mm_cpumask(int cpu)
 static int take_cpu_down(void *_param)
 {
 	struct cpuhp_cpu_state *st = this_cpu_ptr(&cpuhp_state);
-	enum cpuhp_state target = max((int)st->target, CPUHP_AP_ARMADA_TIMER_STARTING);
+	enum cpuhp_state target = max((int)st->target, CPUHP_AP_LOONGARCH_ARCH_TIMER_STARTING);
 	int err, cpu = smp_processor_id();
 
 	/* Ensure this CPU doesn't handle any more interrupts. */
@@ -1303,7 +1303,7 @@ static int take_cpu_down_post(void *_param)
 	enum cpuhp_state target = max((int)st->target, CPUHP_AP_OFFLINE);
 	int cpu = smp_processor_id();
 
-	WARN_ON(st->state != CPUHP_AP_ARMADA_TIMER_STARTING);
+	WARN_ON(st->state != CPUHP_AP_LOONGARCH_ARCH_TIMER_STARTING);
 	/*
 	 * Invoke the former CPU_DYING callbacks. DYING must not fail!
 	 */
-- 
2.53.0

