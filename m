Received: from flow5-smtp.messagingengine.com (flow5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C288D1C8FC4
	for <loongarch@lists.linux.dev>; Fri,  6 Sep 2024 09:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725616568; cv=none; b=otC2ZC3N8gTD7oZ8CebvCAS/wBg3s5HxfQdp45XbJg84SFEAiPgC2f1El2iXzk3rIJ0zPhGScoE53AmsDMeuI4k9ctzmqynJp79yf1ubGq7yrr8HWAcKHJFp2ff7RWPuQwLwMSmmbMotig4wguWwH10BmyMv6nMEigz21mp3LKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725616568; c=relaxed/simple;
	bh=gUUvPOjWWjObJ8l/tpxlAMuAowT/tNkWWi/REiyptbc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=EwiDtHIjslX81Gfp5bsb5ETnNI5Kzj7iibfn+615f8iyC4CPvtz6YmY33x1C/N9Cv1oOYo/TT0IQwkMpalvjil6N7K3yoIoMjGqSvp8bm6sHVgGJ7QnVAlBss9t4twaymha/VHnQYdttygYuh4oExhpwFdzwy9k/sDzyUMeeqhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Cma88D0g; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YgAPQauN; arc=none smtp.client-ip=103.168.172.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Cma88D0g";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YgAPQauN"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id AFD7B2002D6;
	Fri,  6 Sep 2024 05:56:04 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 06 Sep 2024 05:56:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725616564;
	 x=1725623764; bh=spCdL3tE0yzwRJuzWoP/dh86M1NxHAaaOfguj/M3bzI=; b=
	Cma88D0g5A7fxF7e1V4mXGBjVHxirMssk0FBQK4EMQSGfMiy8f3dyAvI7/6AtwOO
	YlgJllHqtEY1khbMWztrp3oPt40NDjJ8BMGNKtqqEmVfPaujpnhFPkvWqUGQxl8c
	/2sMwk3DR8zPvU9L0cKnOiIRhobWNxb5t+HGLJOcjG6ojTfQDNGhu4fMhtzaZwos
	lK7fymt7/XY27ZqAK5m0zM5JPmNyD3nJQ8bbZ1bW9N9ZRZEgxtjz/o2OgNxr97Ia
	6yUnUFzOGylWbu7MeihxJR00a9yL82ng7KCYeQqYZpFaxBOAyZRb2gGcDEIXBt4N
	hs6L15qVpt/x6SHz2lvwNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725616564; x=
	1725623764; bh=spCdL3tE0yzwRJuzWoP/dh86M1NxHAaaOfguj/M3bzI=; b=Y
	gAPQauNE6VOg0WAPifu+oG5IiSAqrQA5hlf1szYIEejmGSMwas1zqtJyqaWuxUY8
	XUp4Iiff3woDjsCEpNo3Ovp6hVjfrJ4m+MxaKp85JPmZ5EAnaQ7sogz83cnKRbMB
	N6po9qOAKMy7yGwr4bCcQUQeA/0hS+vAYY7QMtgxtDXzq6W05ci3KwMv0b3oj1p7
	GZND9HyrwkPrRnb5yHeWBVKaJNL16/BdsXZnW1hUslxJtBm+yqi8NagtKQlkmvaF
	d5r/bn0SPtFIA139lN5cnU+I+OsmGV6ZdcI6K7xxx04PkF05+5daJhgLUNJyNSQD
	G5CFmU3NT6E2KPibGRmvA==
X-ME-Sender: <xms:s9HaZuN9kBIvipXumlTwAFLBqNZJH9lokz7mY4AGXhiNxhJc1pyyRA>
    <xme:s9HaZs-n2edA_zXthff5qvkMtWo_mAmI3y3aVpEklcrOLVxJRlkOoRpEhu8zxhVq5
    tWur9jkODPTcBqYmXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeiuddgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdeg
    jedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedt
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprh
    gtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghp
    thhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegthh
    hrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepuggr
    vhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehmphgvsegvlhhlvghrmh
    grnhdrihgurdgruhdprhgtphhtthhopegrnhgurhgvrghssehgrghishhlvghrrdgtohhm
    pdhrtghpthhtoheptghhrhhishdrthhorhgvkhesghhmrghilhdrtghomhdprhgtphhtth
    hopehmrghtthhsthekkeesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:s9HaZlTFpHCabvrGwtGCuyj8UCP3chGy3ayy2lxa5II3HhJaGRzw4Q>
    <xmx:s9HaZuvoxAX-XNASrusd6JvdGpJcjnSu1u07F5gCi618fvKzOPKAuw>
    <xmx:s9HaZmcSAh24Cvm_B1doI2_Ar_s4Fg-8jkXrHW0LP8bvpbGktGy4TQ>
    <xmx:s9HaZi38RADCOkowGXyKAVN9AXuBWzLGcs6MGv1Hls0IxolFh4L6bg>
    <xmx:tNHaZttVEn21oLIo14eu01ANQj91lVyu4acUXhdplHJ6yJ6FwzJEMTmZ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E5FF5222006F; Fri,  6 Sep 2024 05:56:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 06 Sep 2024 09:55:42 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: guoren <guoren@kernel.org>
Cc: "Charlie Jenkins" <charlie@rivosinc.com>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>,
 "Matt Turner" <mattst88@gmail.com>, "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Gerald Schaefer" <gerald.schaefer@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Andy Lutomirski" <luto@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Muchun Song" <muchun.song@linux.dev>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, shuah <shuah@kernel.org>,
 "Christoph Hellwig" <hch@infradead.org>,
 "Michal Hocko" <mhocko@suse.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 "Chris Torek" <chris.torek@gmail.com>,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
Message-Id: <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
In-Reply-To: 
 <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to 47 bits
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 6, 2024, at 09:14, Guo Ren wrote:
> On Fri, Sep 6, 2024 at 3:18=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> w=
rote:
>>
>> It's also unclear to me how we want this flag to interact with
>> the existing logic in arch_get_mmap_end(), which attempts to
>> limit the default mapping to a 47-bit address space already.
>
> To optimize RISC-V progress, I recommend:
>
> Step 1: Approve the patch.
> Step 2: Update Go and OpenJDK's RISC-V backend to utilize it.
> Step 3: Wait approximately several iterations for Go & OpenJDK
> Step 4: Remove the 47-bit constraint in arch_get_mmap_end()

I really want to first see a plausible explanation about why
RISC-V can't just implement this using a 47-bit DEFAULT_MAP_WINDOW
like all the other major architectures (x86, arm64, powerpc64),
e.g. something like the patch below (untested, probably slightly
wrong but show illustrate my point).

     Arnd

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm=
/processor.h
index 8702b8721a27..de9863be1efd 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -20,17 +20,8 @@
  * mmap_end < addr, being mmap_end the top of that address space.
  * See Documentation/arch/riscv/vm-layout.rst for more details.
  */
-#define arch_get_mmap_end(addr, len, flags)			\
-({								\
-	unsigned long mmap_end;					\
-	typeof(addr) _addr =3D (addr);				\
-	if ((_addr) =3D=3D 0 || is_compat_task() ||			\
-	    ((_addr + len) > BIT(VA_BITS - 1)))			\
-		mmap_end =3D STACK_TOP_MAX;			\
-	else							\
-		mmap_end =3D (_addr + len);			\
-	mmap_end;						\
-})
+#define arch_get_mmap_end(addr, len, flags) \
+		(((addr) > DEFAULT_MAP_WINDOW) ? TASK_SIZE : DEFAULT_MAP_WINDOW)
=20
 #define arch_get_mmap_base(addr, base)				\
 ({								\
@@ -47,7 +38,7 @@
 })
=20
 #ifdef CONFIG_64BIT
-#define DEFAULT_MAP_WINDOW     (UL(1) << (MMAP_VA_BITS - 1))
+#define DEFAULT_MAP_WINDOW     (is_compat_task() ? (UL(1) << (MMAP_VA_B=
ITS - 1)) : TASK_SIZE_32)
 #define STACK_TOP_MAX          TASK_SIZE_64
 #else
 #define DEFAULT_MAP_WINDOW     TASK_SIZE
