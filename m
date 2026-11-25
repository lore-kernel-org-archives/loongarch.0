Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645388;
	b=UEdd8/tahdV4vhKsk4QaoF4OcO87DqtMvKltdK7XPfunI8eXP53mM8OXE9GUHe0vMf9N
	 Cns7UzbfpFXg8rbK4QayjqasY+zGpz8oLj3vm3uafNJHSPPuvXOfmjOqtBVLNrC6Fnd+o
	 LKAakqq+XVrKQDsCqWrrfGb766vuuGwzAPPVWHpIlCeDKpmBGZYfL9zHnKfAOg/udqq66
	 qJDcDVEykYihPGZ35QYw6i+Od9cwieToL2CZD9+TSBBEUUxrNCc73xV0oNTPzygzlDgbo
	 ExohKTsvCzVIsIJ64ei9H8M0+OT4p0sIblHXpy83DqA1mp1mPum1lmUwAbObOfIIp5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645388;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=v/l60rRgc0fjoeitGXm1249Kx/JRtvkQpTTQlS485Rs=;
	b=jNVCJNZRvYqGDfrHG1d/Lp+SsfSDViQk/MPw0GgNdbfA5xQuwu5x6nGELWCZW0u2xQiX
	 FnNduKbaLtDLnRXwvuZLl84/PfTyUwGuovm6BaLqbPKlnNNxZq6lpmTTu+EzruUEJtSUi
	 eBxdikuX+WzCse+7cl1e9qXj/gQLmIZfNzkqwNDaskQLSMVBZD2o1KbdWSv/HUXB4Yrzj
	 4GuTQXV4CGoE5fyVxK38K81JhMOxlYfiYurklfdMJ+UijgQLtemVnaAcYt2XTUBXroSV0
	 jDL9kztjV7mn2iYmYoAYs5PPKDvjgXww3o4Q78Wc7AI5NakS2/3i7pO5ydKJFBK+FuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gm3M9C+E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD7D606A327;
	Wed, 25 Nov 2026 22:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gm3M9C+E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FEBB1F000E0;
	Wed, 25 Nov 2026 22:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795645388;
	bh=v/l60rRgc0fjoeitGXm1249Kx/JRtvkQpTTQlS485Rs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Gm3M9C+EILQ0lrbFuk9ILjoSEtQXd1qPecfsCOvIlgkzyYdZZ4B1k53g/Ocv1zhLC
	 j9tuD+BDNLRTFc3943gxyCjZG56eDhNMjojXGIAGvJq6cYb01Yfb2pMjTcadaUQ9/C
	 /jGlRymeThtm5/IGYZtr98Ne+q26nk3zeuhPH7ynoNehQ7BY4JxquvV7JW+ETisqLF
	 e8Gao4niXUHH6ZbbfdnMIBKOLPyQrJMrMyD1avF9alPG0TKRmnZY5hBbb1hJFCcsnK
	 Ytzc45cZQ44YZBJTXe0WjFwKWGZe3S8/St3lk42EppT4hj/YUZnMc1LrnzF/sSwW2p
	 Julbv8ePYCHQA==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Phil Auld <pauld@redhat.com>,
	Radu Rendec <radu@rendec.net>,
	Thomas Gleixner <tglx@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Waiman Long <longman@redhat.com>,
	loongarch@lists.linux.dev,
	Michael Kelley <mhklinux@outlook.com>
Subject: [PATCH 09/47] irqchip/loongarch-avec: Move CPUHP_AP_IRQ_AVECINTC_STARTING post stop_machine()
Date: Wed, 25 Nov 2026 23:21:52 +0100
Message-ID: <20261125222230.22508-10-frederic@kernel.org>
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
Content-Transfer-Encoding: 8bit

Between CPUHP_TEARDOWN_CPU and CPUHP_AP_OFFLINE, stop_machine executes
all the teardown callbacks while temporarily stopping/pausing all CPUs
in the system. This doesn't mix well with running RT or isolated tasks.

In order to transition smoothly from global stop_machine to finer
grained synchronization between teardown callbacks and the other CPUs,
a new stop machine post function has been introduced to be executed
after the main one with IRQs still disabled while other CPUs can exit
stop_machine().

avecintc_cpu_offline() can run concurrently with other CPUs because
loongarch_avec.vector_matrix protects the internal structures.

Move this teardown callback to post stop_machine() accordingly.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
Tested-by: Michael Kelley <mhklinux@outlook.com>
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
2.56.1

