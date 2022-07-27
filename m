Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D2F7A
	for <loongarch@lists.linux.dev>; Wed, 27 Jul 2022 16:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1658939083;
	bh=URBEKTfwamiTdM/8PEcGrd5kvmSXQHincxTHAC54EM0=;
	h=Subject:From:To:Cc:Date:From;
	b=NZkdcT/0CeqNwa/lruV78hA5Li3djhwETZd0GhLUQsL1WThIV9La26O4FVQMIqnLQ
	 UztdGKT98oWuQd5Ws2bHX5M1RrLfC71n6A1m998hW8LY4E5Sy3XBaJ2Wm1OOTifeNf
	 +lRE/0m418PzjJwBa/iovnZQjtJzRyzHS6wWF69U=
Received: from localhost.localdomain (xry111.site [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id D6D5E66986;
	Wed, 27 Jul 2022 12:24:42 -0400 (EDT)
Message-ID: <385f63bcbee8e37c42f479ce9cdc7e7d731d419b.camel@xry111.site>
Subject: [PATCH 0/5] LoongArch: Support new relocation types
From: Xi Ruoyao <xry111@xry111.site>
To: loongarch@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Huacai
 Chen <chenhuacai@kernel.org>
Date: Thu, 28 Jul 2022 00:24:40 +0800
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

The version 2.00 of LoongArch ELF ABI specification introduced new
relocation types, and the development tree of Binutils and GCC has
started to use them.  If the kernel is built with the latest snapshot of
Binutils or GCC, it will fail to load the modules because of unrecognized
relocation types in modules.

Add support for GOT and new relocation types for the module loader, so
the kernel (with modules) can be built with the "normal" code model and
function properly.

Tested by building the kernel with Binutils & GCC master branch, and
running the kernel with 35 in-tree modules loaded.

Link: https://github.com/loongson/LoongArch-Documentation/pull/57
Link: https://gcc.gnu.org/r13-1834
Link: https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Df0948=
2a

Xi Ruoyao (5):
  LoongArch: Add section of GOT for kernel module
  LoongArch: Support R_LARCH_SOP_PUSH_GPREL relocation type in kernel
    module
  LoongArch: Support relocation against _GLOBAL_OFFSET_TABLE_
  LoongArch: Stop using undocumented assembler options
  LoongArch: Support modules with new relocation types

 arch/loongarch/Makefile                 |  5 +-
 arch/loongarch/include/asm/elf.h        | 37 ++++++++++
 arch/loongarch/include/asm/module.h     | 23 ++++++
 arch/loongarch/include/asm/module.lds.h |  1 +
 arch/loongarch/kernel/head.S            | 10 +--
 arch/loongarch/kernel/module-sections.c | 72 +++++++++++++++++--
 arch/loongarch/kernel/module.c          | 94 +++++++++++++++++++++++++
 7 files changed, 229 insertions(+), 13 deletions(-)

--=20
2.37.0


