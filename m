Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865C9BA57
	for <loongarch@lists.linux.dev>; Fri,  3 Feb 2023 22:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F51EC433A4;
	Fri,  3 Feb 2023 22:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675461969;
	bh=aYP90nun0m184p5nqJ440uJdYMPBc75BRwnXChmaA8w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VsXyVxEzpcXfilpsFzlk6M+CFr48cROlB/51bhZgU6jOeFjXZsnPEU0o5unZX/lCv
	 2s92UV6qDiMVkuwzYYUjibPqLJ0HXjNhVnjkYmHeRyzqPPq35RZXb4I0QJBtFIGHpB
	 c05PiWxmuAZTCIhURQlmym/9FanZLhY6P9ATEQuCGE0TqcRKoW2+BmfvDSOl4rFdLQ
	 XSQn6q+5Ug0Ma8OfVVzvmkDeLJyoNXKVlNE8zy8/Deb7fBUoAeD5LMKeY5LeE3R65b
	 soPuLuhsbfOdSWeFsj5Fs8fj/wW9ZQHSRSDFTboVl+QsDtK3UkzNs6tqSgpIcVZYxl
	 mpggjtNUkp/ng==
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
Subject: [PATCH 15/22] sh/cpu: Expose arch_cpu_idle_dead()'s prototype definition
Date: Fri,  3 Feb 2023 14:05:24 -0800
Message-Id: <ab9832f83b626a3a78cc398a7c1ffc23c25a9ea1.1675461757.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675461757.git.jpoimboe@kernel.org>
References: <cover.1675461757.git.jpoimboe@kernel.org>
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
 arch/sh/kernel/idle.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/sh/kernel/idle.c b/arch/sh/kernel/idle.c
index 3418c40f0099..114f0c4abeac 100644
--- a/arch/sh/kernel/idle.c
+++ b/arch/sh/kernel/idle.c
@@ -4,6 +4,7 @@
  *
  *  Copyright (C) 2002 - 2009  Paul Mundt
  */
+#include <linux/cpu.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/mm.h>
-- 
2.39.0

