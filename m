Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645473;
	b=hBhlm3TCJIov6uNoulg5Yc35GI32HgPlFfIWZhFeL/q21lsa9P6UjiAbDcVApACtnFe5
	 aqI1O5X3ecQABU1AQBqlTKdMy7LbO8gdtXkjHf3H097J/Xoa/Kp8baF5KVt1vpJrZ//+g
	 uevYivSjtK3m5kCl3xy8809IqpmTpFTDOuEb01HUVeZPQQv96dH14yUuhxkVygkUNT1ZF
	 UR/XcPOaQvEfmsxXWQRU8X0X1r8tcCDRX8u8/9eX30UWdmj4P70HgdDeUJD8mL8X++RcX
	 e1Gsrvqomjihry5Fs6zMMSc2UcaIizo4kHXDtEKH/P1wxBEc6++eS8xws8i4exiYTIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645473;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=gBmNrGq3RNzCKqqhg+xClDFX35O37eWM+PM6CEZ8gf0=;
	b=R33K9zipDgGyN4oy1CsPCRCzD8oJU+km/TD3QBlAA4DMUEZV2bagIx/YTr2alFO70XQG
	 RqII0uDtLiwughSQ4IPjN6arf83pCaHn74v4OIv67KSrY5YFAHr9V4dbK8bxN+msgESAW
	 7DyexXGk7lra4It+zgeEeVWKZcl3yDKGj0AzubyUMAOB2JDS1nss/YXksa4fNoUe/jQEf
	 HRfndx+ZTj8V7w4akNNJ9dRvNott4ICNulKRgLGd/98dzOWlvAoZEiFVQJdc17QGFG+/c
	 2yt+PBjWcdoWytbg/hEgEqewUGxU2xpVXtUE5pPqV77x6vo56TRXIxpYjmelFxGZRHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MzP4WCvd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38726606A327;
	Wed, 25 Nov 2026 22:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MzP4WCvd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E061F000EC;
	Wed, 25 Nov 2026 22:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645473;
	bh=gBmNrGq3RNzCKqqhg+xClDFX35O37eWM+PM6CEZ8gf0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MzP4WCvdjUyy0mhmWOHYVRnpegBYfTFUotgU5+DXP85R1zWxfIUXoJMiyLceOCqg/
	 AgDZtLqvoPGMw1pYGBqSOEE+C40tps3JE+bJRxsP5UOuCEDiQNEYpaoIEa6d6tHfeC
	 BCqZ2IK87E1DWe5Ld95n1qjhLbSPmi1Ay2fhCp9m2kO1c3bUUiPsN4Dpi1Ka+2ah/7
	 kqIzZd2qjT09CovxJrFstgvy9LBoA1lFceSNlGCrmF7p/HgbyaSRMTXT9XM30/aUZM
	 pu5WOtOY6Pk2GXSVy7a2Zbpa1YVXQNpbaSg86Id9VOHKAvpKdZgfCafx12GccGqMH9
	 Rb7nJgbODDQBw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
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
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 31/47] LoongArch: Move CPUHP_AP_LOONGARCH_ARCH_TIMER_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:22:14 +0100
Message-ID: <20261125222230.22508-32-frederic@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125222230.22508-1-frederic@kernel.org>
References: <20261125222230.22508-1-frederic@kernel.org>
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
all the teardown callbacks while temporarily stopping/pausing all CPUs
in the system. This doesn't mix well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

The teardown callback here simply clears the interrupt on the CSR,
operation that can run concurrently with other CPUs.

Move it to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
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
2.56.1

