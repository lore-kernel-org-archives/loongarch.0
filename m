Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885CE285C89
	for <loongarch@lists.linux.dev>; Sun,  1 Mar 2026 23:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772408583; cv=pass; b=sUZA5kAovExbANSIGpq5ObIJlVGj8WXSc/dvlhtY8bCc/HvZBgA7FvlrqmWgtuChD1g5Oh2S+d4i0rtvSWn7qMfxKFJ6EuCktcNPpPRBTseilzDfSUuOwlIvnz8akGcJ5edbw5CfZCQHzUgcMZb7aE4NFclK1skPmzDmxUwTb7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772408583; c=relaxed/simple;
	bh=2lumFFkJ0ZwYBqoADHIq/QJZcgPn5Y+Rf9ui93BHJdQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ISKkfkPiIUKkT7sWWCot9+vAXzRazMhlwY5tvGXIV3KYfQkwRiJsMz1YnhQ0wta6voKB9RWuMb5sz8Zcva6GL2NeeDvjuyNPY98EzTPtdu2VGuEShuFhV6F7PoGq2h4xs2iNI5opIPiOJ+7d6H/VmrlnzvZLyxOSEtvBuyScbUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bev+u322; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bev+u322"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bda3b4318dso294280eec.1
        for <loongarch@lists.linux.dev>; Sun, 01 Mar 2026 15:43:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772408582; cv=none;
        d=google.com; s=arc-20240605;
        b=MFPu6NC2VFlGuTzPV8npNWvxcQ0UorZrifM2iCLw7foMymoXBquL+30D9bQaGrzGL5
         YVaEKxCk6lkdgw+hpejNC3nNfu9k0Bps48PX4qFfecCwY/n0VCxJexX8iDE7Fzt9tjP9
         Q0JU/oqqt6LoUUfb4SyBxBMkK30A3YUWKpY9FguigqUd5AAFkoqUWutQkdyTdkxMoCLx
         05nqAo+tu6dD2aREAzNCFzx31ecl1lK/wzzd2RJjHPFTAKGoeo+I/8vXjrdwcTw/hi//
         HRfENfZFtnzMDL1gUinvJuBFFyBYlNJsTW8mYnzeyCnpzPj0bBcLsNUCpOGcBPwSu73i
         m1+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=U1gYsY7zWUiNKxFF1e5Vu7YTdyDgHqmsZtnGIts9t9Y=;
        fh=n2AXDJEsTSPT/LDZqOizK8x3zV3RQ8ZqD5GsliMkYmE=;
        b=lL+GwnNuFbbi3m3IJt7VBGc7LYHl7jmpOi8jGzxhbezOcZHCEQa8fC0vOfT827CSw/
         W+1r5lOJ5cLuEnYGmMv5+mjCKvYRpSK8pU+u4ufKWJQnNey8plPU8d/Zqk2EP2JFgvF1
         nuy5naiVcOi2ZBZtMhGJHxaDa/PM+qo+N6BUgDFGuda3g9B6/kWdBasjt6TmVJLF7raF
         jclAXLKk3SJhfBAIFzAC5inXMMupPyGYCkbK+k+lBiycIydoS/VEGdQNprSTg2CgV6hx
         wBnHu3uiELVZxqjKdx3+D6eZiTes1sF2sB0i0NoZexeFPF2xwzQDn59jhfo7FgUagrLZ
         Nk4g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772408582; x=1773013382; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U1gYsY7zWUiNKxFF1e5Vu7YTdyDgHqmsZtnGIts9t9Y=;
        b=Bev+u322UWeKIlYEbhSoqlNxDqOTZfHuYii+HTls8S4yETCJijeY1aMjONFnFouD3f
         ZHnZ0E+PFtkmgYGkLAzgfcwSOrA7WrVBMcvyt3d5+mk8e7ujmgDRzOxCHinwaJO9619G
         55YkYNc3gfY9Wj1bWoKtRqMZIyHou8UYUeEw9UuY/64NxHA7MJqWdirRFE2S0H4p7iBn
         +esXJxFxOZ5OVKsg5/73gRXJ29F8RlfX3gki7iaQ+Z+F466rtQwJ9uX+k2KNJvN1Queu
         vDRq1yYLL1UCfWHSHPpKSPKIlRwzcURInQZE/BqoVENp8PfW3cA8+Iyhz3Ra/vZx0AiG
         hDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772408582; x=1773013382;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U1gYsY7zWUiNKxFF1e5Vu7YTdyDgHqmsZtnGIts9t9Y=;
        b=aIg/PW9elCTENchRzLB2qONzll31rFwKOF1G+VSl8HXkjGZ7nOq/Z5pVV5qNS/jpeK
         P9UVH6V6BsxVLe/tg/sW6qe7nu1aL/yr3ksLkwL9yHddTFPwLU/5z2m6t8p9IqOIc0sn
         Egz0uclla5ZGgM7AOst1d9qFfZy90ro8b0fWAdkqR3UUimrX2SVx3HAzaVe1hFygDUtx
         4OiElTlTTdc4fXZtkvkjjvpWBGyPxxCp9EFAw6SRGsbeGY9xyHx04iM9n+bCFDMqeA40
         tXMJeVkxGfHhF8ffnyfsiWD6hdlizAv0rPY2GTfYJkG6/vFM/i0ECrnSJpsTCPUoNGHL
         bu1w==
X-Forwarded-Encrypted: i=1; AJvYcCVfUlECElNF1f9pNLGcnWrEGa3myo1OuEJXP90Il3uVWLdHAplrOZpt7I86DcB3vKQpdIZdM/zmpdk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxBQogJpBEWK4jP0U2XxLj9QcHUgrRuNSOdIrEqRi4O8uzmNMW1
	WBqL/JEpSfXrsx1/YeCf9ijE8phxYOy++dIrRJ51TSe3qC7bHuZW7x2bLqnZWHOpV/CJHOAGGpp
	yWDIa51Sbo61j4dEJdtcF2y7QqRzu5lo=
X-Gm-Gg: ATEYQzzjdBdE4dbBIftqrWr6Nfb/BQsn68V+nbvg+1hWr9jbtx8bOyW4p0YIZ5vWaDb
	4R7nPMJ5QczE3miipySvq8EUTpe2I9yUASIaL9xThIywspmkZQG/AWf3G6WGWU+xAC3WgHIJDrR
	YILUbo2vvl0hidrDvl7jgGPGBy4FaFEnhz1Sv+FUTddLXeiX1gqnegVu6ifjGDVZJbWMLhQV5ja
	+a5dpCoA+gzeeLoDbqzeWUydEWvo5d4+e+/pnvpZteRXPYcmBze1uHySjaX8nHXFznJfw+6nIbU
	Gl9tDV96s8VkTbv6fH8UFBuuWP24PPj+mpEWNiSQ92Ypx5KnNz8L7E0ew4IHB29s96jufYlNBAr
	UHj6uju8WBy8nNRKx3QpLuhVY3EUl
X-Received: by 2002:a05:693c:2c8f:b0:2be:171c:2177 with SMTP id
 5a478bee46e88-2be171c2ccdmr15106eec.7.1772408581518; Sun, 01 Mar 2026
 15:43:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 2 Mar 2026 00:42:49 +0100
X-Gm-Features: AaiRm52fTXrGz5PlTORiyphpsPMjHdsF2ymu7kB9CFR5ioFaHp3gh72XIk80BjI
Message-ID: <CANiq72mAQxbRJZDnik3Qmd4phvFwPA01O2jwaaXRh_T+2=L-qA@mail.gmail.com>
Subject: loongarch64 objtool warning with LLVM 18 in Rust object file
To: Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, loongarch@lists.linux.dev, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Nouveau Dev <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"

Hi objtool & loongarch,

I noticed an objtool warning in a Rust object file for loongarch64 in mainline:

drivers/gpu/nova-core/nova_core.o: warning: objtool:
_RNvMs1_NtNtCs3LxSlPxFOnk_9nova_core3gsp4cmdqNtB5_4Cmdq3new+0x238:
return with modified stack frame

From a quick test, I saw it happened only with older upstream Rust
binaries (1.78.0 to 1.81.0), so I suspected a switch of major LLVM
version, and indeed with 1.82.0 LLVM 19 is used instead of LLVM 18.

With LLVM 18 I get:

    addi.d          $sp, $sp, -2032
    st.d            $ra, $sp, 2024
    st.d            $fp, $sp, 2016
    st.d            $s0, $sp, 2008
    st.d            $s1, $sp, 2000
    st.d            $s2, $sp, 1992
    st.d            $s3, $sp, 1984
    st.d            $s4, $sp, 1976
    st.d            $s5, $sp, 1968
    addi.d          $sp, $sp, -2048
    addi.d          $sp, $sp, -2048
    addi.d          $sp, $sp, -2048
    addi.d          $sp, $sp, -112
    ...
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x870
    add.d           $sp, $sp, $a0
    ld.d            $s5, $sp, 1968
    ld.d            $s4, $sp, 1976
    ld.d            $s3, $sp, 1984
    ld.d            $s2, $sp, 1992
    ld.d            $s1, $sp, 2000
    ld.d            $s0, $sp, 2008
    ld.d            $fp, $sp, 2016
    ld.d            $ra, $sp, 2024
    addi.d          $sp, $sp, 2032
    ret

While with LLVM 19 I get:

    addi.d          $sp, $sp, -2032
    st.d            $ra, $sp, 2024
    st.d            $fp, $sp, 2016
    st.d            $s0, $sp, 2008
    st.d            $s1, $sp, 2000
    st.d            $s2, $sp, 1992
    st.d            $s3, $sp, 1984
    st.d            $s4, $sp, 1976
    st.d            $s5, $sp, 1968
    lu12i.w         $a2, 1
    ori             $a2, $a2, 0x870
    sub.d           $sp, $sp, $a2
    ...
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x870
    add.d           $sp, $sp, $a0
    ld.d            $s5, $sp, 1968
    ld.d            $s4, $sp, 1976
    ld.d            $s3, $sp, 1984
    ld.d            $s2, $sp, 1992
    ld.d            $s1, $sp, 2000
    ld.d            $s0, $sp, 2008
    ld.d            $fp, $sp, 2016
    ld.d            $ra, $sp, 2024
    addi.d          $sp, $sp, 2032
    ret

So I suspect the stack pointer is not getting tracked properly and
thus the mismatch. Is it a known limitation for `objtool` on
loongarch64?

It is a very big frame, so I guess maybe it is not even expected to
have to deal with such a case to begin with.

I think we likely want to avoid that big stack size to begin with
anyway (Cc Danilo and Alexandre).

I am copying the full disassembly of the symbol in the case it
triggers the warning below.

Thanks!

Cheers,
Miguel

[1]

<<nova_core::gsp::cmdq::Cmdq>::new>:
    addi.d          $sp, $sp, -2032
    st.d            $ra, $sp, 2024
    st.d            $fp, $sp, 2016
    st.d            $s0, $sp, 2008
    st.d            $s1, $sp, 2000
    st.d            $s2, $sp, 1992
    st.d            $s3, $sp, 1984
    st.d            $s4, $sp, 1976
    st.d            $s5, $sp, 1968
    addi.d          $sp, $sp, -2048
    addi.d          $sp, $sp, -2048
    addi.d          $sp, $sp, -2048
    addi.d          $sp, $sp, -112
    move            $s1, $a1
    move            $fp, $a0
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $a0, $sp, $a0
    st.d            $zero, $a0, 0
    lu12i.w         $a1, 129
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $s5, $sp, $a0
    li.w            $a3, 0xdc0
    move            $a0, $s1
    move            $a2, $s5
    move            $a4, $zero
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0x6c>
            R_LARCH_B26    dma_alloc_attrs
    beqz            $a0, 352    # <<nova_core::gsp::cmdq::Cmdq>::new+0x1d0>
    move            $s0, $a0
    move            $a0, $s1
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0x7c>
            R_LARCH_B26
<kernel::sync::aref::ARef<kernel::device::Device> as
core::convert::From<&kernel::device::Device<kernel::device::Bound>>>::from
    move            $s2, $a0
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $a0, $sp, $a0
    ld.d            $s3, $a0, 0
    lu12i.w         $s4, 1
    move            $a0, $s5
    move            $a1, $zero
    move            $a2, $s4
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0xa4>
            R_LARCH_B26    memset
    lu12i.w         $a0, 512
    move            $a1, $zero
    add.d           $a2, $s3, $a1
    bltu            $a2, $s3, 292    # <<nova_core::gsp::cmdq::Cmdq>::new+0x1d8>
    st.d            $a2, $s5, 0
    add.d           $a1, $a1, $s4
    addi.d          $s5, $s5, 8
    bne             $a1, $a0, -20    # <<nova_core::gsp::cmdq::Cmdq>::new+0xb0>
    addi.d          $s5, $sp, 32
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $a1, $sp, $a0
    move            $a0, $s5
    move            $a2, $s4
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0xe0>
            R_LARCH_B26    memcpy
    move            $a0, $s0
    move            $a1, $s5
    move            $a2, $s4
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0xf0>
            R_LARCH_B26    memcpy
    lu12i.w         $a0, 64
    st.w            $a0, $sp, 32
    li.w            $a0, 0x3f
    st.w            $a0, $sp, 24
    li.w            $a0, 0x20
    st.w            $a0, $sp, 12
    st.w            $s4, $sp, 28
    st.w            $s4, $sp, 8
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $a0, $sp, $a0
    st.w            $zero, $a0, 0
    st.w            $zero, $sp, 20
    li.w            $s4, 0x1
    st.w            $s4, $sp, 16
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $a0, $sp, $a0
    ld.w            $a0, $a0, 0
    stptr.w         $a0, $s0, 4096
    ld.w            $a0, $sp, 32
    stptr.w         $a0, $s0, 4100
    ld.w            $a0, $sp, 28
    stptr.w         $a0, $s0, 4104
    ld.w            $a0, $sp, 24
    stptr.w         $a0, $s0, 4108
    ld.w            $a0, $sp, 20
    stptr.w         $a0, $s0, 4112
    ld.w            $a0, $sp, 16
    stptr.w         $a0, $s0, 4116
    ld.w            $a0, $sp, 12
    stptr.w         $a0, $s0, 4120
    ld.w            $a0, $sp, 8
    stptr.w         $a0, $s0, 4124
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $a0, $sp, $a0
    st.w            $zero, $a0, 0
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x20
    add.d           $a0, $sp, $a0
    ld.w            $a0, $a0, 0
    stptr.w         $a0, $s0, 4128
    move            $a0, $s1
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0x1a4>
            R_LARCH_B26
<kernel::sync::aref::ARef<kernel::device::Device> as
core::convert::From<&kernel::device::Device<kernel::device::Bound>>>::from
    st.w            $zero, $fp, 48
    st.w            $zero, $fp, 40
    st.d            $s4, $fp, 32
    st.d            $s3, $fp, 24
    srli.d          $a1, $s0, 0x20
    st.w            $a1, $fp, 20
    st.w            $s0, $fp, 16
    st.d            $s2, $fp, 8
    st.d            $a0, $fp, 0
    b               60    # <<nova_core::gsp::cmdq::Cmdq>::new+0x208>
    li.w            $a0, -12
    b               40    # <<nova_core::gsp::cmdq::Cmdq>::new+0x1fc>
    lu12i.w         $a1, 129
    move            $a0, $s2
    move            $a2, $s0
    move            $a3, $s3
    move            $a4, $zero
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0x1ec>
            R_LARCH_B26    dma_free_attrs
    move            $a0, $s2
    bl              0    # <<nova_core::gsp::cmdq::Cmdq>::new+0x1f4>
            R_LARCH_B26    <kernel::device::Device as
kernel::sync::aref::AlwaysRefCounted>::dec_ref
    li.w            $a0, -75
    lu32i.d         $a0, 0
    st.d            $zero, $fp, 0
    st.w            $a0, $fp, 8
    lu12i.w         $a0, 1
    ori             $a0, $a0, 0x870
    add.d           $sp, $sp, $a0
    ld.d            $s5, $sp, 1968
    ld.d            $s4, $sp, 1976
    ld.d            $s3, $sp, 1984
    ld.d            $s2, $sp, 1992
    ld.d            $s1, $sp, 2000
    ld.d            $s0, $sp, 2008
    ld.d            $fp, $sp, 2016
    ld.d            $ra, $sp, 2024
    addi.d          $sp, $sp, 2032
    ret
    nop
