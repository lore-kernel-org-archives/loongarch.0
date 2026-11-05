Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896352;
	b=R/iUFymwsHQA5OJIrNaXYlJMVMEORabtmMKHXrkqomnt8nUognk1eIUQJ80YzK2wMwel
	 IK8LSfbDIORRyKsqb9PPaOaUJY7DNF20zzUK+NKAuJJzl7dsisXyiU+AcnAihSpcCGdHi
	 sqkZWs6ZLTvUJUR9RY0ohQ2ONQYg4/YrsHl9dpYuiY1kcUxbiuycKppufpbBTNItzyZZ0
	 EcAFaANVynNxZ5VVa55tSDLZxyPB2q+jtK3rpFD9zBgGidN7Em2UjVjXAxn4rxU+Bz4/j
	 AXw+cjVuFsePNuonTkktKefu2UsFM4Z28Pcyuqsaxcr7QEORPtLR/154O++keDE0HIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896352;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=biSoxrhnLuQDqwToTDtCbiEZWgO0HWQz0Fm4SnSBs9Q=;
	b=OnCWezI68c+7Qm6w3GRFHGS9U084GcVy31upmttpNHWvtljQ9La+SV93gTfIhBC6FVLY
	 jRpi65tPF+G30ZO+bqb0BS6hX82YpfH+QPxzfy07UbRX0wvMRCFa25riCLDB63LplSXG5
	 WlRiRo1KRgwN6UoU6fS9v4XiowhNH0DT6U5nhTc0N3YIBqz/PaPghI8E3+plN7EZJXXyi
	 m3DZJbebUcYQ0qfu+gl4yL2LTUfZYASNKuD+Jud/YEEJrScJXg0HFVqmJ3KnAfnWaiR/8
	 D9txyxE5KMETwHDDV+n54klw4Cme8ffJMHu3CBJfXf0ytV3BEwVrXE1dY9VeYSco7BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mdOQ/bI3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B8C606BF00;
	Thu,  5 Nov 2026 16:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mdOQ/bI3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C3E1F00919;
	Thu,  5 Nov 2026 16:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896351;
	bh=biSoxrhnLuQDqwToTDtCbiEZWgO0HWQz0Fm4SnSBs9Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mdOQ/bI3RPUVBKBpP4yXZchns4JHVjYcmKohkPK0Ddf1/fx2D+PC8VeibUBg+aH+i
	 EfpsVWQNDbrKJBX0gUaiGmpvtHPkab8WgNL1vzWSArW8sMfYYTHNvaEa8kmh/kyT/M
	 xtqToXjM8xFAbw6omK9Gqakq+jeJl/E/EHOjmGhVW7dyfGVgOFHfY3DAp0CkHsIirW
	 BBHESKCwjBKyzSd5tfnFnTz35Cxs0PwEu08M1QaMx+XE+sB96Z78vc7z8FZ42G4n5a
	 2VYOamYXxDIV3To7XhHbrgV6nztvbyhgi1a5uI6ohj58VataeyYVGDVEFpWVt9CL4M
	 39ogeL5qrj/dA==
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
	loongarch@lists.linux.dev,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 31/47] LoongArch: Move CPUHP_AP_LOONGARCH_ARCH_TIMER_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:29 +0100
Message-ID: <20261105163045.38862-32-frederic@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105163045.38862-1-frederic@kernel.org>
References: <20261105163045.38862-1-frederic@kernel.org>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
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
index 8a563de99dc1..9a3936cd6d79 100644
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

