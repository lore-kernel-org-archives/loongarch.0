Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769802;
	b=D0/rjzkiYGOgUyLAnJE1+La7RLGZE4CIC9l9Q1v7XcUZFdclK5ttp80Ot4QC60qniBxJ
	 Nudpm6sTLR5DgcbQkw6qCAnHvhMe1sQ0c6dO54QhDS0TKY9uoF8FQwnu1uPGSmt4q6aq2
	 Ieu7KD9aB1mJMjDoa/DY/EA5m9ruU1/bBSB4wQcls34U9Vk2l2GvD6GWrvH/ikwFhaKmj
	 Ok3r+dS6AyUOz/rN1MAKRXTSaeUrfaEuiHQmsZqC5yPn5XWEo3SbAlNVWxaICSqPqPiCP
	 DwT+LX6n3RiAHcKzoT0Axre65EfSB7p3cMtuE/xQDi3JlH1Z5Yz45+tFTYT5teCqnSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769802;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Date:From:To:CC:
	 Subject:User-Agent:In-Reply-To:References:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=HSZuOyG4pKU7vS7IAE1/JM7GV7AMLK9kKAml8a9XFjg=;
	b=dcpN9MQlHw2Sb7Aotzto+VGHDsf3x9UpLGN4uO0VixkX9Qgh0fH/py1AoCfdQy0Mx/CE
	 xjoVx8sBXfcW6SqxWbe5PDkbCbQwNV5NPRgbHnNLhFXyCxrAsMPV7Q857QmwEvm+KlQ7P
	 UZKZFtNbPJO5/GhU2paNNKZsXWMXfUbvAGWkjsVAU6VLk4r8fyHWlk+5oDo4pFV7XzB0x
	 Moo+vkfoo2+NnD+w169NPz+koFm1l8SPKzoJkIGd4HRYL2AQK0v7H/QS1wT/Twp97Vhdp
	 /56UtVdNAKxGY5vkULGFY3F8WtPRvCVT1A/eto4k4s+3iBo+nO/3XuzxUKVxIvuliNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zytor.com;
	spf=pass smtp.mailfrom=zytor.com;
	dkim=pass header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026092801 header.b=bg3EdVPh;
	arc=none smtp.remote-ip=198.137.202.136
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2ABC606A31A
	for <loongarch@lists.linux.dev>; Fri, 23 Oct 2026 15:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2ABC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026092801 header.b=bg3EdVPh
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 69NFZXZ03099269
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 23 Oct 2026 08:35:34 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 69NFZXZ03099269
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026092801; t=1792769740;
	bh=HSZuOyG4pKU7vS7IAE1/JM7GV7AMLK9kKAml8a9XFjg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=bg3EdVPhWbIzGb2nl9Fuu7ddKA32ap1IfMZqOW5ffhrypmSKfeUyH9oyqT8VD3Ffz
	 xZsox0txpA5nJa7ukTQnYEsijMIDw9G5ZjUIZiWIb+27Pyu0RsP3R+zGiaKYe7BVy+
	 iRxHHbQf4iwE7FhJHOTs1QJ5w9pUe7E5sHjmWhEmmReaob00Q9qPt+SYyK9PjSybeL
	 +p7u2wZEoGsZue51CvFVoyMDBkPLzVTCMehBpRAesG0upThtigcmczDR9dlEcb9c41
	 ORCX4s+3pvA5/OOHfkjvkVcTf9EC4bUg2TYV5h1Rs0daKiD/q8yN03OHv7o44uTkJq
	 IP7H4102peo1g==
Date: Fri, 23 Oct 2026 08:35:29 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Thomas Gleixner <tglx@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
        x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-m68k@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
        Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>,
        Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
        linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org,
        =?ISO-8859-1?Q?Michal_Such=E1nek?= <msuchanek@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5Bpatch_16/18=5D_x86/entry=3A_Get_rid?=
 =?US-ASCII?Q?_of_the_sys=5Fni=5Fsyscall=28=29_indirection?=
User-Agent: K-9 Mail for Android
In-Reply-To: <871p9g1s3w.ffs@fw13>
References: <20260707181957.433213175@kernel.org> <20260707190254.493733289@kernel.org> <20261022142425.3Wx-RrU5@linutronix.de> <87fqxx1r80.ffs@fw13> <87cxt11ktr.ffs@fw13> <1149A39E-BEBA-46EA-94F4-4DFFC4733EF5@zytor.com> <871p9g1s3w.ffs@fw13>
Message-ID: <F44B99C1-297F-406C-AEAC-3CC8F4F36AED@zytor.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 23, 2026 6:09:07 AM PDT, Thomas Gleixner <tglx@kernel=2Eorg> wro=
te:
>On Thu, Oct 22 2026 at 17:22, H=2E Peter Anvin wrote:
>> On October 22, 2026 2:34:08 PM PDT, Thomas Gleixner <tglx@kernel=2Eorg>=
 wrote:
>>>-static __always_inline void do_syscall_x32(struct pt_regs *regs, unsig=
ned long nr)
>>>+static __always_inline bool do_syscall_x32(struct pt_regs *regs, unsig=
ned long nr)
>>> {
>>>+	if (!IS_ENABLED(CONFIG_X86_X32_ABI))
>>>+		return false;
>>>+
>>>+	/* Preserve the historic insanity of treating -1 special on x32 */
>>>+	if (nr =3D=3D ULONG_MAX)
>>>+		return true;
>>
>> It was never limited to x32=2E=2E=2E
>
>Tired brain misread the test output:
>
>[RUN]   Running tests under ptrace: modifying the default return
>[RUN]       Checking system calls with msb =3D 0 (0x0)
>[OK]                x32 syscalls 0:-64=2E=2E-2 returned -ENOSYS as expect=
ed
>[OK]                x32 syscall 0:-1 returned MODIFIED_BY_PTRACE as expec=
ted
>[OK]                x64 syscalls 0:-64=2E=2E-1 returned -ENOSYS as expect=
ed
>
>But that's because the "-1" on x32 is actually 0xFFFFFFFF while on x64
>it's 0x7FFFFFFF=2E
>
>The whole mess comes from using -1 as indicator for syscall abort which
>is undistinguishable from a syscall(nr=3D-1)=2E
>
>Bah=2E Let me restore this nonsense=2E
>
>Thanks,
>
>        tglx
>
>
>

Yeah, that was always a WTF=2E
