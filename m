Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0E2BA3F
	for <loongarch@lists.linux.dev>; Fri,  3 Feb 2023 22:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFBCDC43333;
	Fri,  3 Feb 2023 22:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675461954;
	bh=Nv4dCsRjZPJcR8Ogp1/tV2KDCC1o8+1g518bJ1o/vGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EDbJ111u3eCADaYKD54CpyZ0JMmqpOrzzMmnYjXzHZSsYrm/4CYyey2Z0wcm3Ug+i
	 /wWTyRNufqtNN6FOu+4L4eJ5OWCxVh8O3T+8tp9PjOInweU1pbJeTJNuIlbkzad5f+
	 RGO/mzCZqaY3L+eYlLP4NxS9DPtcMKLHu9uOv6zqaV3nY1TK51Jj8i1APul/ewp0jQ
	 VD5lhy+pfciXqGOTF81kCW9d5/GVuwdYAQQFFK4SbiHpSoFhV8oiJ7M5QGRozfNCnL
	 VVODqRRYWtF0ME1xhs1u28HfcEyYdPw4BuNvmzLEotDSzhpKoG3CmU5LVplR+SCqRH
	 MkVSqOzYgRMYw==
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
Subject: [PATCH 07/22] loongarch/cpu: Make sure play_dead() doesn't return
Date: Fri,  3 Feb 2023 14:05:16 -0800
Message-Id: <054ac5118731ae340a8bb7026a15ab78bf57ae89.1675461757.git.jpoimboe@kernel.org>
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

play_dead() doesn't return.  Make that more explicit with a BUG().

BUG() is preferable to unreachable() because BUG() is a more explicit
failure mode and avoids undefined behavior like falling off the edge of
the function into whatever code happens to be next.

Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/loongarch/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/smp.c b/arch/loongarch/kernel/smp.c
index 8c6e227cb29d..51f328169a7b 100644
--- a/arch/loongarch/kernel/smp.c
+++ b/arch/loongarch/kernel/smp.c
@@ -336,7 +336,7 @@ void play_dead(void)
 	iocsr_write32(0xffffffff, LOONGARCH_IOCSR_IPI_CLEAR);
 
 	init_fn();
-	unreachable();
+	BUG();
 }
 
 #endif
-- 
2.39.0

