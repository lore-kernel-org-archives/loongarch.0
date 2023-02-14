Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD942CAB
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 07:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94853C433A7;
	Tue, 14 Feb 2023 07:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676358410;
	bh=/WRpZ+fgwXF0z/GQYKwOihjxOQ5dza8faN+YuvFg6xA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dAlEp0FZUQmU3s+7nxa65cD0n3h9c7eJJZjXGr3hhHtUntee21fQKh3l9ntfq4KbC
	 3uL5hEjnYQn4bxN/OMzXjHF0pqPHb9d1Mj6gggaMFr2ZB1IbDgksvUGZPatb6zeY4p
	 US6fZpQ/eFrQEhekkbHzHVcs9ntVzGENf7WwrjcjRMEAT4p0JrsF0O+9aigRk4dHvY
	 p2C+OwYq/kn5g8didBavBbKvz/LCCMVYK+ImBjDxSPohVp1RyvxwBWm6s0VIbeK7gX
	 Zs1DSSupvJ0IqkiCQuQhWek6mO45nkdVQiVqMyeg2qyQXHiVZ0vEb4+2b613bDaJFf
	 6y9cII9Se4ZJg==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: jgross@suse.com,
	richard.henderson@linaro.org,
	ink@jurassic.park.msu.ru,
	mattst88@gmail.com,
	linux-alpha@vger.kernel.org,
	linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	guoren@kernel.org,
	linux-csky@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	loongarch@lists.linux.dev,
	f.fainelli@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	tsbogend@alpha.franken.de,
	linux-mips@vger.kernel.org,
	jiaxun.yang@flygoat.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	linuxppc-dev@lists.ozlabs.org,
	ysato@users.sourceforge.jp,
	dalias@libc.org,
	linux-sh@vger.kernel.org,
	davem@davemloft.net,
	sparclinux@vger.kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	linux-xtensa@linux-xtensa.org,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	bristot@redhat.com,
	vschneid@redhat.com,
	paulmck@kernel.org
Subject: [PATCH v2 01/24] alpha/cpu: Expose arch_cpu_idle_dead()'s prototype declaration
Date: Mon, 13 Feb 2023 23:05:35 -0800
Message-Id: <b0405c2ac5686303b6026e1ac27cfd769b21a7d0.1676358308.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676358308.git.jpoimboe@kernel.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Include <linux/cpu.h> to make sure arch_cpu_idle_dead() matches its
prototype going forward.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/alpha/kernel/process.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index ce20c31828a0..d1f2e8b6b107 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -9,6 +9,7 @@
  * This file handles the architecture-dependent parts of process handling.
  */
 
+#include <linux/cpu.h>
 #include <linux/errno.h>
 #include <linux/module.h>
 #include <linux/sched.h>
-- 
2.39.1

