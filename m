Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82544805
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 12:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1658838566; bh=9bWxi3ljm9e3TKjm5slWR1sg1Soj1cur22b/Km6jeEA=;
	h=From:To:Cc:Subject:Date:From;
	b=Ahq7BQp/EO51/CXzZyFA6J1SAHR+PCsRfKp96JAmuLrRAOblUOVc2BBWBVdkewSAK
	 A7F5B42Zyg4oEw+5ubvOmqjcjeK1GOlrSmKP8Gaj7nsgF7RzcBcwokqwm1Pdc+uIk1
	 4Wk1fx4kjNE8O15SYb6T1vHht6aj2Gdvwko3FCNI=
Received: from ld50.lan (unknown [101.228.137.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 022A560104;
	Tue, 26 Jul 2022 20:29:25 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v2 0/6] LoongArch: minor assembly clean-ups
Date: Tue, 26 Jul 2022 20:29:14 +0800
Message-Id: <20220726122920.2291947-1-kernel@xen0n.name>
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

v2:

Migrated "BLT foo, zero" and "BGT foo, zero" too, suggested by Jinyang.

WANG Xuerui (6):
  LoongArch: Use the "jr" pseudo-instruction where applicable
  LoongArch: Use the "move" pseudo-instruction where applicable
  LoongArch: Remove several syntactic sugar macros for branches
  LoongArch: Simplify "BEQ foo, zero" with BEQZ
  LoongArch: Simplify "BLT foo, zero" with BLTZ
  LoongArch: Simplify "BGT foo, zero" with BGTZ

 arch/loongarch/include/asm/asmmacro.h | 12 ------------
 arch/loongarch/include/asm/atomic.h   | 24 ++++++++++++------------
 arch/loongarch/include/asm/cmpxchg.h  |  4 ++--
 arch/loongarch/include/asm/futex.h    |  6 +++---
 arch/loongarch/kernel/fpu.S           | 12 ++++++------
 arch/loongarch/kernel/genex.S         |  4 ++--
 arch/loongarch/kernel/head.S          |  6 +++---
 arch/loongarch/lib/clear_user.S       |  2 +-
 arch/loongarch/lib/copy_user.S        |  2 +-
 9 files changed, 30 insertions(+), 42 deletions(-)

-- 
2.35.1

