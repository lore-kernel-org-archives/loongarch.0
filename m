Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033052FB6
	for <loongarch@lists.linux.dev>; Sun, 24 Jul 2022 13:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1658669467; bh=WcS7iGoJ333TOC3s0jewOCUmntpcawpYbCpyjpfrCag=;
	h=From:To:Cc:Subject:Date:From;
	b=J7X/RWtnMkWnOshYH4l2oMh091MTIPomXs5JDaR30Jj+EnQcVUr5DkMIjxhjuyZIz
	 d1rVNkmpQ8jIet9ZMxPlUW7OoR9zOrpgd41ooZojlogShb9C2+tzNTK/Psk/f2hY+h
	 STz7aoh5tQqyucxtYW/NEDgf5dY0OzZttIRBCGkU=
Received: from ld50.lan (unknown [101.228.137.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 979206067B;
	Sun, 24 Jul 2022 21:31:04 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH 0/4] LoongArch: minor assembly clean-ups
Date: Sun, 24 Jul 2022 21:30:48 +0800
Message-Id: <20220724133052.1872885-1-kernel@xen0n.name>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

Hi,

Just several minor clean-ups to the few lines of loongarch assembly
that have been irritating me recently. Most of them belong to the "let's
not support prehistoric toolchains" kind, no functional changes
whatsoever.

Tested on 3A5000 without problem.

WANG Xuerui (4):
  LoongArch: Use the "jr" pseudo-instruction where applicable
  LoongArch: Use the "move" pseudo-instruction where applicable
  LoongArch: Prefer BEQZ over "BEQ foo, zero" where applicable
  LoongArch: Remove several syntactic sugar macros for branches

 arch/loongarch/include/asm/asmmacro.h | 12 ------------
 arch/loongarch/include/asm/atomic.h   | 16 ++++++++--------
 arch/loongarch/include/asm/cmpxchg.h  |  4 ++--
 arch/loongarch/include/asm/futex.h    |  6 +++---
 arch/loongarch/kernel/fpu.S           | 12 ++++++------
 arch/loongarch/kernel/genex.S         |  4 ++--
 arch/loongarch/kernel/head.S          |  6 +++---
 7 files changed, 24 insertions(+), 36 deletions(-)

-- 
2.35.1

