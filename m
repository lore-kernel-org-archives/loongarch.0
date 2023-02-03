Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DC2BA57
	for <loongarch@lists.linux.dev>; Fri,  3 Feb 2023 22:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265AEC433D2;
	Fri,  3 Feb 2023 22:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675461976;
	bh=qzio4RRFUV3T4RxMjX88Z4lXma5TBrgxzmQ4rFvXUQ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k65vkzVP6z141oLnhjfrwBtKaSVH4NDImaR6KsAo5tm4t33CTjXSkk1Kc002UVteN
	 xjJFsLbbmrzV/oEDThT0uVKwXiyt81xJhbaZw5d1W0aCS8iJi8ZN1n47ZmOxdaXlne
	 brWwWunBne264Md4i+0bg1dx7gUqkbA9IFbPGDydUxEo11sw9DVpvqZHgK2MDBJDej
	 trULeFzTKyDLcTkcAA8D9XSzTnv4n/e1IfgE/o/RMoSp7z0wipVfyAtH77G7/nVsy4
	 343nx2w/X70+IGMD3m7acnwGo130O5HOl5lHXueR8i/o1BQV7Ek1JE0i3Q3oOf9k9F
	 DgZNg3mMxOn+w==
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
Subject: [PATCH 19/22] xtensa/cpu: Make sure cpu_die() doesn't return
Date: Fri,  3 Feb 2023 14:05:28 -0800
Message-Id: <13cfde410b50047d778f535d12d928813e92c745.1675461757.git.jpoimboe@kernel.org>
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

cpu_die() doesn't return.  Make that more explicit with a BUG().

BUG() is preferable to unreachable() because BUG() is a more explicit
failure mode and avoids undefined behavior like falling off the edge of
the function into whatever code happens to be next.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/xtensa/kernel/smp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/xtensa/kernel/smp.c b/arch/xtensa/kernel/smp.c
index 4dc109dd6214..7bad78495536 100644
--- a/arch/xtensa/kernel/smp.c
+++ b/arch/xtensa/kernel/smp.c
@@ -341,6 +341,8 @@ void __ref cpu_die(void)
 	__asm__ __volatile__(
 			"	movi	a2, cpu_restart\n"
 			"	jx	a2\n");
+
+	BUG();
 }
 
 #endif /* CONFIG_HOTPLUG_CPU */
-- 
2.39.0

