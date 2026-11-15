Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794726812;
	b=HlgXblV8oPFAjml1VN6vBZApirP78/fKaQAUxUQ3LuaFGh+j2v3Qh1JByFipQF8u+zff
	 Pg6xCuK62a3MWJelOmk7VgqP+dV620dDtoKgj+CS1bbKOKUsmWmIuhQ6KmVamDK57af14
	 3IYmfF333jcGYe6rkLKgulGdoA5iuOmVkBXQLGiyQDjvhEhv1NX/1EOQe2vwaa53yvQow
	 1pFgseV3N6zMObS+3I1bbYcn1lMDZajYThGsuzitaoKNwqOlzCFoiwpWbl7YOMe6rvB5I
	 h1cjDqfpZR6V13LyhvRUIqv/78k1M+xM47FDThYzI7aQ0zStIMRXIScEhBpXSSutyuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794726812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=i0sztYeDoa78GRxByi5DPGRDZ13zK/I8mczcB1W5Z+o=;
	b=HdoCtusFoYD5aNEXdrf4Pc4ytj8TrwqogoWu3TNh653DV6dPGOoXwmxDAPkPzZ0bRIhF
	 crFvAZIVEFi/3w2ZUP5felnpwtdHKgxznXQBvL8EbYrlA10U1h4D43bdIzqIlWYIgQrA8
	 oOHdm7fco9wC7vm7c2u9wsLAPOYv4/J0ebnTYW0GhatLUkGeGJoC2voWrMc+sC6t0vbTR
	 x9CXUqowzN8PSC+R9hdc6FrTkiPjYe1r+e2Y/05NHQq23wN4II999rSqzVIuDIZdr7DKV
	 c54FePVmuMhTlm9m/KD/ceYkyYETS9cBOoZG2QF0qimBbfdTziGBnSUpge1r+PJv9Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q2lrYHJp;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642F5606A32F
	for <loongarch@lists.linux.dev>; Sun, 15 Nov 2026 07:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 642F5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q2lrYHJp
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a2761c69fbso2761590c88.0
        for <loongarch@lists.linux.dev>; Sat, 14 Nov 2026 23:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794726811; x=1795331611; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i0sztYeDoa78GRxByi5DPGRDZ13zK/I8mczcB1W5Z+o=;
        b=q2lrYHJpZGOBJsfhKrM1+hX1urN8njnGlwgT+9NRQsQ4xgPasAau6PrH8nMfQRCk+7
         t3blbs35O+rrMzDYsdnAdrPOD967I7iW/tt1EDBwIXeE7LP8ACbU3gE5PX3huDdh2QlK
         GBqF/2cxU8LZXhZIMEMwNmpUTTE2GJ8XY1WffjjXSIwarFfDKLPaduSJwiv3JQSVLmBa
         mSk4EWouX3QVTMz7IWmUwnhJ9uvq5JQNekfC6W5agLIGppXPRu/JAc7eg9HMN+BFfeZF
         mx7+WUArmdWmGUkk+M5qWpvFhrTzmArzVYD5/bHFpCVA2+IlZNXZsD829vYChfwOPn0F
         16UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794726811; x=1795331611;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i0sztYeDoa78GRxByi5DPGRDZ13zK/I8mczcB1W5Z+o=;
        b=ngRMo0/S/encnF3RS272Zk+evDDCiNQ2h52CUcdREjg7R0VTL28VWhcwiCbBEveFe9
         JvGan8XCV1xcIN3YlJ3ExgmIEFiD1QJgx3lHFmtnA4fhjEzSHjCVUrf7A8z1X0u+HrPE
         XdGBiFW375wFD67ItszZKAOxbwudympslyq8lbX2e5nLIxmA67Bh3GdT7AANJoE+HD8V
         vfe99M621YrOXasVUR1EGFJS4/mGdFLJ/4KI7/b84ifS+5qHsoICXWME5lU2MFlNWPY1
         Dh3ARCsn+bNOPcApAAGKa4mjIDGhamVKhQcSN6k6zGLtqLk2YJwbvu6ASwUHi4aNAtc+
         BAnA==
X-Forwarded-Encrypted: i=1; AL+hErF1xBuObIqUVwym6zONhYSMHbqPogc/b0ZAjzOZCF8GCzpJ5LcSbBch6AOHdPFjiyB59gqaEwH7D/s=@lists.linux.dev
X-Gm-Message-State: APuU4Z94cewFUPjJ+DtiWyfPfKXUCM2Y8OVzx2GhexXPBGEh2IfF02n1
	UbIBS4HBmkohw/wU+3eJC6bs/6YuOaGA7MZiMCVLbB1HpkClBPpoxPQU
X-Gm-Gg: AYBFou0/sr1YBXZFgmiqQGwlh1w4CMKjAbcp2HDzRVXi+8VzYApntV6LiwUA2DHTSNT
	xJuhCIuA1BNSGZPO/LdfMsfUKHkD3Z2ccXL2KOGGi1UdenZ25vJXbF5nP49euvtQMgOWzGNtLsK
	1L1+EVq0v4V3Vej/lqdL5CMod4sQiE8MA1Q7j9MVZUZklvktvG+KbU+7gS852xzefTQG4+a39In
	BFaBAYX74u6elgGZTQonzCpGROOndrjHwfi8ImfedS6a78xtKAp6bj6ga1xe6+JyPDPodaRUHPN
	NUgpXDtZUbukQQNrbeuo/DezZsdA+y9Owg6cZ7AWSU5lSursTmnzZXXvuFTTqt5b7klJtxR7WyQ
	lBQuepNzYJ3mvJnhhFvXwKJT8cm6KV2NjoMExtAvvdDqIPfvzXZna1L+pNqvNk/f8g+WfZCj/7c
	JlsTkbP5jGHXqcUWFOFoY7EsFri1dvS1RSVQFiwPar6vjufdO/MfEpfcojt8UKZoD0MyORgN7tV
	fSIET8MsCFwgUe8H2OIbP4XZVSVQxi0EAfn9nLNGZJsZhgIdOI1oEhwcm1TVBQW68uR/RaycAHX
	CK+6WmZr2fjLVpqbC3nI1WI+li0=
X-Received: by 2002:a05:7300:6148:b0:36a:7bb7:4609 with SMTP id 5a478bee46e88-37967dd7e1dmr11471490eec.34.1794726811302;
        Sat, 14 Nov 2026 23:13:31 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm27441185eec.27.2026.11.14.23.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:13:30 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Mike Rapoport <rppt@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Andrew Morton <akpm@linux-foundation.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, "David S.
 Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, Donald
 Dutile <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>, Heiko
 Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen
 <chenhuacai@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>,
 Liviu Dudau <liviu@dudau.co.uk>, Luis Chamberlain <mcgrof@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Nadav Amit
 <nadav.amit@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Peter
 Zijlstra <peterz@infradead.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell
 King <linux@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>, Song Liu
 <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner
 <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, netdev@vger.kernel.org,
 sparclinux@vger.kernel.org, x86@kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>
Subject: Re: [PATCH RESEND v8 11/16] powerpc: extend execmem_params for kprobes allocations
In-Reply-To: <avlTdlK9ErlqVRYl@kernel.org>
Date: Sun, 15 Nov 2026 12:33:31 +0530
Message-ID: <4idi8tks.ritesh.list@gmail.com>
References: <20240505160628.2323363-1-rppt@kernel.org> <20240505160628.2323363-12-rppt@kernel.org> <3f7af771-87a7-4ae7-9919-bc4c23bd31c9@kernel.org> <avlTdlK9ErlqVRYl@kernel.org>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Mike Rapoport <rppt@kernel.org> writes:

> Hi Christophe,
>
> On Fri, Nov 13, 2026 at 03:36:01PM +0100, Christophe Leroy (CS GROUP) wro=
te:
>> Hi Mike,
>>=20
>> Looks like I missed this change ...
>>=20

I didn't initially get what Christophe meant here. Then I came across this
reply of from him[1]. So looks like somehow between v3 to v8, something got
changed?=20

    On powerpc book3s/32, vmalloc space is not executable. Only modules=20
    space is executable. X/NX cannot be set on a per page basis, it can onl=
y=20
    be set on a 256 Mbytes segment basis.

    See commit c49643319715 ("powerpc/32s: Only leave NX unset on segments=
=20
    used for modules") and 6ca055322da8 ("powerpc/32s: Use dedicated segmen=
t=20
    for modules with STRICT_KERNEL_RWX") and 7bee31ad8e2f ("powerpc/32s: Fi=
x=20
    is_module_segment() when MODULES_VADDR is defined").

    So if your intention is still to have an executable kprobes, then you=20
    can't use vmalloc address space.

[1]: https://lore.kernel.org/all/1cb41761-29d0-5d33-b7c1-0ca3acaa810d@csgro=
up.eu/

>> Le 05/05/2024 =C3=A0 18:06, Mike Rapoport a =C3=A9crit=C2=A0:
>> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>> >=20
>> > powerpc overrides kprobes::alloc_insn_page() to remove writable
>> > permissions when STRICT_MODULE_RWX is on.
>> >=20
>> > Add definition of EXECMEM_KRPOBES to execmem_params to allow using the
>> > generic kprobes::alloc_insn_page() with the desired permissions.
>> >=20
>> > As powerpc uses breakpoint instructions to inject kprobes, it does not
>> > need to constrain kprobe allocations to the modules area and can use t=
he
>> > entire vmalloc address space.
>>=20
>> Using breakpoint means the segment must still be executable.
>> On book3s/32 VMALLOC segment is not executable, while module segment is.
>>=20
>> See commit 6ca055322da8 ("powerpc/32s: Use dedicated segment for modules
>> with STRICT_KERNEL_RWX")
>>=20
>> See report and fix at https://lore.kernel.org/all/ed03d290d440d579a81ae0=
b7de5243721291d903.1794543909.git.ritesh.list@gmail.com/
>
> I'll take a look, thanks!
>=20=20

Thanks Mike for taking a look. Sorry, I should have ccd'd you there, I
guess I missed it. However, the changes are these one here [2][3]

[2]: https://lore.kernel.org/linuxppc-dev/82c4973addebd82923c460cb44221f5b7=
6146afe.1794572365.git.ritesh.list@gmail.com/
[3]: https://lore.kernel.org/linuxppc-dev/f75f2cf97f44375fd2c8820e0caeab703=
cdb371c.1794572365.git.ritesh.list@gmail.com/

-ritesh

