Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CF22FAF
	for <loongarch@lists.linux.dev>; Tue, 26 Jul 2022 15:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1658851046; bh=fNCsqq3/+8XC7exFTH4tBVMM/ixvjgAI7b5fp2rShmo=;
	h=From:To:Cc:Subject:Date:From;
	b=sImTLHpJSdEVSg6/3YmWoK93AkGkpw4DtbQ8tUnnoi37wumlRZklhwrAByJjAvUSl
	 M7jOXolUdVFe6G1QbznlZiVjscbTglokV6Gmxpc7XueNcGv2rqKqUUjYQEDq6m9EnK
	 gCKqachU53gQ4TMVf+Yew53P+/3u7GHb4zCiKmtw=
Received: from ld50.lan (unknown [101.228.137.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 8E78260610;
	Tue, 26 Jul 2022 23:57:24 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Jinyang He <hejinyang@loongson.cn>,
	loongarch@lists.linux.dev,
	WANG Xuerui <git@xen0n.name>
Subject: [PATCH v3 0/8] LoongArch: minor assembly clean-ups
Date: Tue, 26 Jul 2022 23:57:14 +0800
Message-Id: <20220726155722.2402337-1-kernel@xen0n.name>
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

v3:

- Reordered patches (suggested by Huacai)
- Migrated all non-definition uses of raw register names to ABI names,
  unraveling more chances of simplification as a result (suggested by
  Jinyang)
- Re-tabbed all assembly files after the cleanups

v2:

Migrated "BLT foo, zero" and "BGT foo, zero" too, suggested by Jinyang.

WANG Xuerui (8):
  LoongArch: Remove several syntactic sugar macros for branches
  LoongArch: Use ABI names of registers where appropriate
  LoongArch: Use the "jr" pseudo-instruction where applicable
  LoongArch: Use the "move" pseudo-instruction where applicable
  LoongArch: Simplify "BEQ/BNE foo, zero" with BEQZ/BNEZ
  LoongArch: Simplify "BLT foo, zero" with BLTZ
  LoongArch: Simplify "BGT foo, zero" with BGTZ
  LoongArch: Re-tab the assembly files

 arch/loongarch/include/asm/asmmacro.h    |  12 --
 arch/loongarch/include/asm/atomic.h      |  24 ++--
 arch/loongarch/include/asm/barrier.h     |   4 +-
 arch/loongarch/include/asm/cmpxchg.h     |   4 +-
 arch/loongarch/include/asm/futex.h       |   6 +-
 arch/loongarch/include/asm/loongson.h    |   4 +-
 arch/loongarch/include/asm/stacktrace.h  |  12 +-
 arch/loongarch/include/asm/thread_info.h |   4 +-
 arch/loongarch/include/asm/uaccess.h     |   2 +-
 arch/loongarch/kernel/entry.S            |   4 +-
 arch/loongarch/kernel/fpu.S              | 174 +++++++++++------------
 arch/loongarch/kernel/genex.S            |  12 +-
 arch/loongarch/kernel/head.S             |   8 +-
 arch/loongarch/kernel/switch.S           |   4 +-
 arch/loongarch/lib/clear_user.S          |   2 +-
 arch/loongarch/lib/copy_user.S           |   2 +-
 arch/loongarch/mm/page.S                 | 118 +++++++--------
 arch/loongarch/mm/tlbex.S                |  98 ++++++-------
 18 files changed, 241 insertions(+), 253 deletions(-)

-- 
2.35.1

