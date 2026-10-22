Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792692269;
	b=VpFSpFCBXJl15QNqJsOhIUBAIbpMTKLxlipu++6GjNblFwsAM/QYm9CoJ9n9OtdyYwjv
	 KzsuqdqnoRu43CFxuDGijrBfrJPRCRprAsumwIsdVHOXnvzqkyDtmiCPMbGYy1D7mPbne
	 KwXRLWCzCTon7bwbQb0Dg3zgBOiJeNJStVcSZh+ecBohDT/oL0bnuoY0wsEgPUPkN1072
	 rRZYxhKduXrx0QokrSIAu7wBFdlMlOzWWIMK8AOzwjTL1BaZ+gvZAhUwOaLhN2PWfQ3DE
	 GKk8dlaVPzl4HbLCJZGtYNzge5/HW6ryD5Dh7ICt83gsV/BH+KnKsOGqpFVijxQBszw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792692269;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=RhnfvKmfoxy+HUbDsORpInOXf0Z9ck2xlJJLmjkZQrQ=;
	b=WnBl9zA4HzmWqSKzaxVgw82KNKZ/2CfmSGms8cxG+9m5o3CtxJh7u5twXvTJbGAjp9m3
	 Yh8lX3eR4zcD6RV3NENj0N+9hlAAnoDNNh3ogMMGmp1g35ELNtTqsV/sFMYhIvTh896tT
	 SlTNnVFOPDzL+QsLSZa/XUWGNhKB+7OpFn2eMsvqkK3CidywkXtKuJLO4bVwkjtLfHOsG
	 4Ac9VDHzUS4w7OYtTA/fytqPk1jC1FuTv+vkoNrOhNHmaL30LXEMif5SEijQPnetRP1ew
	 89ThFXZMGc4hVnP0PNCjBxNEENnjo0GXp4NmjZ9ZHh4nPtAMpwB/4P6mMSSz+Xdlv9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zytor.com;
	spf=pass smtp.mailfrom=zytor.com;
	dkim=pass header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026092801 header.b=wS32jOje;
	arc=none smtp.remote-ip=198.137.202.136
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6A1606A320
	for <loongarch@lists.linux.dev>; Thu, 22 Oct 2026 18:04:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A6A1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026092801 header.b=wS32jOje
Received: from [172.27.3.124] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 69MI2jre822700
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 22 Oct 2026 11:02:46 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 69MI2jre822700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026092801; t=1792692174;
	bh=RhnfvKmfoxy+HUbDsORpInOXf0Z9ck2xlJJLmjkZQrQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wS32jOjeFWsFEs7/XC2lmhjx+vaso38Aa1yvVUAkT9A1W3myWjPjlKJ97J5iL0Ywq
	 bPF69gGCe7jooHw6vT1puqfAAMWwIenPVsBB0BtjXDHBnYwO13DlDPhjiEozTqjEHM
	 Tnne7bJIubMKnpcLaITiN/m+5GZf8SNZmR76JFs4RsiRgOXjXb7KnOu57Xbk4+jf0R
	 res/2bYXDI5YQACu5N7auw0s2PeA2biV4pFQrygkfChnNdCyphEU5uiDFSgPKPiKVV
	 mrz+yPrxO0ZpIXSlYj8frGR29U2PsHFm2Ceilf5VQYeo3Indd2RWAuBubWzuARjG4V
	 DyvcySggronVQ==
Message-ID: <9d875fab-fdad-413e-9737-6160fac2a406@zytor.com>
Date: Thu, 22 Oct 2026 11:00:24 -0700
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 16/18] x86/entry: Get rid of the sys_ni_syscall()
 indirection
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra
 <peterz@infradead.org>,
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
        Helge Deller
 <deller@gmx.de>,
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
        =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20260707181957.433213175@kernel.org>
 <20260707190254.493733289@kernel.org> <20261022142425.3Wx-RrU5@linutronix.de>
 <20261022150235.V2CSdtmu@linutronix.de>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20261022150235.V2CSdtmu@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2026-10-22 08:02, Sebastian Andrzej Siewior wrote:
> On 2026-10-22 16:24:30 [+0200], To Thomas Gleixner wrote:
>> The test could be updated via the hunk below in case the new behaviour
>> is what is expected. hpa made the extension to the test in commit
>> 795e2a023b808 ("selftests/x86/syscall: Add tests under ptrace to
>> syscall_numbering_64").
>>
>> diff --git a/tools/testing/selftests/x86/syscall_numbering.c b/tools/testing/selftests/x86/syscall_numbering.c
>> index ca0eca7b9dced..1435394fba022 100644
>> --- a/tools/testing/selftests/x86/syscall_numbering.c
>> +++ b/tools/testing/selftests/x86/syscall_numbering.c
> 
> Now I notice the fix depends on CONFIG_X86_X32_ABI=y (fails for =n).
> But we want to get rid of it anyway so…
> CONFIG_IA32_EMULATION is not affected (with the fix).
> 
It would be very simple to probe for by issuing a simple system call like
getppid() with the x32 bit set.

	-hpa

