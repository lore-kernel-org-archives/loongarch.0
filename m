Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896281;
	b=p0KhKwfxrVybu4PIQlqwS9SxY0ZE3jZQSyQDmu/asZsGBlNx959bOhtP5JDchNnw0pKL
	 muZcKATDrT9fIaW5LOAR8MyP/hwpgxAxTizihdqytrY6P0w3X2harBrtDXvUJaPdRO0rp
	 Qn6i884577Tfw8SeaohblHW+Wbz8kPVzr0yJnOLpa/epXbOcSlV67iUa7JEycDTgMYsh9
	 7BYO2AWroxMoX/76ULG57B3VbiXgheOAmxLLYStPeui1aHSas/QDmnVRD0NwNvND/BtRN
	 SLQ1hX3o8XkH829mXPysyQC0/zDJ8EbkDiMX9q/gPHfAv0rC2weCQqKrAzKIlGD0xOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896281;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=YA2npxVg6k5J9sxSVutlWm3jl1EqZUxn1NZCd9eHIjc=;
	b=CSRfrF6I1Y+Sg7hQL2htl2nUKIzcyabWYHhHbHGgtXQm+B8ZXNACI/uA81T+NX6Rr0ta
	 xgH5ZwlJ+LGCYvPNK1Rv5AyZyxJLVyS0WRqHlw+U/wVpKP9DvxJUpL4BYVCtHeAwdxAnR
	 dmcWCiKUOoTEjOBhAW4lOThe+83fNP4GEQZD6YjR8c2GWne5Gk5nszNUPXOto/FE+Yw0i
	 AE4A91ag7kpC8lxAM9sXGIiCasfU2IZSNOgY0MCnjON1mHL8T5s9+KBPfonCmgJCaGmQ/
	 TZmgvNeDizM3dUrbA2Kc1PCoGAOufaQrfQzjTOFOLDg/jgF0JfMoX5CT8vcIVO4o+Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nEzQYdkv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AB060A3827;
	Thu,  5 Nov 2026 16:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nEzQYdkv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8445C1F000C1;
	Thu,  5 Nov 2026 16:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793896281;
	bh=YA2npxVg6k5J9sxSVutlWm3jl1EqZUxn1NZCd9eHIjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nEzQYdkv5ZBZQS/poasXuoisk6J7luBxMSZ/tzdcadiPxtIXCzv2V++Q97rd66uMl
	 X8hrmE6lhcjnAfIEMAqakeNpPhZjoCAIxJisXgnGpth6NTDy3jRFYfaMFviP2wRvjk
	 vd+A8/zD2eahNq54EKOpRbaLxDjT44g5qF5YPf0qiF9tUBc55D45RgsUB0C7saH1SC
	 Ad/GivsXZUAMtrOvtZkgNJXYld5+eceOylq7E0sUjw/5pu66Yamk9PSDNQJj8TCJdl
	 nGLibnOzxol9Rk3WG6AZn0qajQUtOgY5fRTsAqU1bYg2hhs0YDigaX1eXXTZDRqckS
	 MQxxV5ta6DfPA==
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
	loongarch@lists.linux.dev,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: [PATCH 09/47] irqchip/loongarch-avec: Move CPUHP_AP_IRQ_AVECINTC_STARTING post stop_machine()
Date: Thu,  5 Nov 2026 17:30:07 +0100
Message-ID: <20261105163045.38862-10-frederic@kernel.org>
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
index ac87ce01d77a..2200c6691ac1 100644
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

