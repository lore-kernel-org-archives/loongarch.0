Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB741101
	for <loongarch@lists.linux.dev>; Sat,  5 Nov 2022 02:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xry111.site;
	s=default; t=1667614547;
	bh=AMol7+6VhSazICOuYDq16Qv5nK+JNzmLP+frS6dtp4w=;
	h=From:To:Cc:Subject:Date:From;
	b=PavNqb80/Rv0flgsr9bzke8g5vquDM2eEV3Sj5XOAoasFBIt1O0p2QC6QflLtWAM9
	 vbPDrbwB2Wrf+kCK0XhQRHfwLZQmqPGGZqsXCZmDKUkUQkAXSDrkr7KBFWFLVCuudp
	 JiT/sP7saxkRNtxILqq6qQsE4g+30nzDk9AxVSLA=
Received: from xry111-x57s1.. (unknown [IPv6:240e:358:11ed:a500:dc73:854d:832e:4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 332DB65A8C;
	Fri,  4 Nov 2022 22:15:41 -0400 (EDT)
From: Xi Ruoyao <xry111@xry111.site>
To: Alejandro Colomar <alx@kernel.org>,
	Michael Kerrisk <mtk.manpages@gmail.com>
Cc: linux-man@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Wang Xuerui <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH] syscall.2: add loongarch
Date: Sat,  5 Nov 2022 10:15:14 +0800
Message-Id: <20221105021514.8344-1-xry111@xry111.site>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Link: https://lore.kernel.org/loongarch/1f353678-3398-e30b-1c87-6edb278f74db@xen0n.name/
Link: https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/unix/sysv/linux/loongarch/sysdep.h
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 man2/syscall.2 | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/man2/syscall.2 b/man2/syscall.2
index 1bac0b9d7..a2aef6d33 100644
--- a/man2/syscall.2
+++ b/man2/syscall.2
@@ -176,6 +176,7 @@ arm64	svc #0	w8	x0	x1	-
 blackfin	excpt 0x0	P0	R0	-	-
 i386	int $0x80	eax	eax	edx	-
 ia64	break 0x100000	r15	r8	r9	r10	1, 6
+loongarch	syscall 0	a7	a0	-	-
 m68k	trap #0	d0	d0	-	-
 microblaze	brki r14,8	r12	r3	-	-
 mips	syscall	v0	v0	v1	a3	1, 6
@@ -301,6 +302,7 @@ arm64	x0	x1	x2	x3	x4	x5	-
 blackfin	R0	R1	R2	R3	R4	R5	-
 i386	ebx	ecx	edx	esi	edi	ebp	-
 ia64	out0	out1	out2	out3	out4	out5	-
+loongarch	a0	a1	a2	a3	a4	a5	a6
 m68k	d1	d2	d3	d4	d5	a0	-
 microblaze	r5	r6	r7	r8	r9	r10	-
 mips/o32	a0	a1	a2	a3	-	-	-	1
-- 
2.38.1

