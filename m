Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FFD26FA52
	for <loongarch@lists.linux.dev>; Thu,  8 May 2025 14:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746713765; cv=none; b=BCeIgDMblLmVfrBtu1GSEDN/C1dPFooLsk7OyjGor2xKBTjAAwb7JycENqAu4mRXCcvg6BslxmxhO48lWW4kB5+zP3BYuYRRdpeo3uz3mTf+4Sgvg2rodfjAmyg+jjNjkxefNKEUqcyO8PSRPwouhtnfio7fUoXzz6KQQ7bJyto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746713765; c=relaxed/simple;
	bh=QDdR5tA6fCYdLD5am3vh8l+BGODzygPrPOJzBOfeJVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PL0WdPILjHpvffluuJzrPNghDEGtJQBsjQOjFAfbgxNYg0r4tx8LLoh6OU3WWoa/edoScql6+eki8kZ1Hs+zPsalY61cHvxTH9KYg2wBCio7eY1IYVzsHny5STp3ogEOtEoSQ8hRG/wExP9Sha8vUWm8STZcL9VKPsrvN+6AhU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aw9IcFzB; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aw9IcFzB"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-476b89782c3so11348821cf.1
        for <loongarch@lists.linux.dev>; Thu, 08 May 2025 07:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746713762; x=1747318562; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDpuFbmKPGhtwFhs8+1sRyHe3lBe73vGf+W6LNv5WMo=;
        b=Aw9IcFzBrN54J09bafOZKA5vT5klohvBUo5sHP7wf0EBA/sMAtIn3vcNDgQ8rbGjX9
         owcK5ZaZKmycCWOj53yTun9/rzeURBUQretdKGluk4KeGxH2vOHqsr04kexQ0gwMqk+e
         BL0ADYFLaONqGw8WowP1S05VPxFM6RUknM2pGoCqKXnWk9mXXoF2PFkeBAnVYPAKSaua
         gFOYprxC/7T0pkqnJ+m6RP0xKb3O4cYmNhoTQhhzJqv/vpTHtvyNLqUfVDHaZQLP8GVS
         wbryNtWnT5jpXts/XsFt+tg9L5QizZHlgS2LX5h4L0Fx0yw4WJnmBp/Sfn0U42dJGeVb
         cK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746713762; x=1747318562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IDpuFbmKPGhtwFhs8+1sRyHe3lBe73vGf+W6LNv5WMo=;
        b=MaGbaK8Ut2UIKJMHhr0/m9fj7L2PTKuYRuQ6uSR6D7Q1SAh3U6kcubDmC/c4KGRMU8
         qOjHziAAYK+fZJhwfzJda7gfahhLZtaZC+dSs9HNJ7Q2gbVaFahAGPZP4JXg1LzXoBYI
         D9VEEp4Ub95ZoaIWRz5EpCIGGX+FmM+IKKGbla1ty+EaCl4Yt4ZVUoTtqDxRzhfV2qso
         xW10m3GTc8jT0Tme9o8NZbKnm1w5HbXS2tKhzXeKMwO2EBxtOCmYzrNnaye21NLDIJlL
         i0t3OHxnHVZvd+mOzRKbn3kO3Y8zQxDzunAlzg0Z55AE5bJaUDcPE4gdp0IKljaXWeuJ
         e85A==
X-Gm-Message-State: AOJu0YwACUjmf6VurM4x1IOjQgXE/tbJKi2HZAKHn+aKQtSRLrMXID0k
	kEh1V/i9xKwrtu4NWCZk+1ICYwzfZc5mWGXDNCPU+Vs4hHsZLol5eS4k0GusU1I4H5Ca7pZXz7Y
	FspVtnuaDsROjss8/BcKvPpQRvMM=
X-Gm-Gg: ASbGnct0gWYYcRoF1PIwt3l7zXl8olixmQNqc/9KeNZq+3arr2vmSg/KnqyjOHGKWDr
	0C9X+C9rPacU7wEsZvJGRgq7USx3ZudeyMaxXiHkwznCws47RWmVS8MJH4/hAZ/yx/6XosKlpGw
	PF2TIMYCE7RhVZ1mZvEFKwUP1zLYA++3vMPmETzVlGPkCGzH3yCU4OSck=
X-Google-Smtp-Source: AGHT+IGWwi9f8f4070aPaewqXIlv5BeMpweYLPsMY8g6yIECw6MfdPIpRTrkMYHJ/KIn4UMTnzqtKzUo89BgwWb56Ns=
X-Received: by 2002:ac8:58d1:0:b0:477:c04:b511 with SMTP id
 d75a77b69052e-4922620f004mr107953411cf.31.1746713761746; Thu, 08 May 2025
 07:16:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2wo3KidH9yrGSNsV522BSkUJyn2TUp==tSv62937xPDMw@mail.gmail.com>
 <8f375e63-c4d5-b9cc-64c4-7563ba5c2763@loongson.cn>
In-Reply-To: <8f375e63-c4d5-b9cc-64c4-7563ba5c2763@loongson.cn>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Thu, 8 May 2025 07:15:51 -0700
X-Gm-Features: ATxdqUEEa1Z1mQa00hevvXcOIkbom88mG0ZyK3kU2QMuIfP-9O-RhE7kX4UTYbM
Message-ID: <CAK3+h2xJX6de6EX=W=Pk8Ai3+-H5U7wQ9AWvQqZZ4MG5vNUUQA@mail.gmail.com>
Subject: Re: [QUESTION] Loongarch bpf selftest liburandom_read.so build error
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, bpf <bpf@vger.kernel.org>, 
	Hengqi Chen <hengqi.chen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 12:23=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 05/08/2025 05:30 AM, Vincent Li wrote:
> > Hi,
> >
> > I tried to build kernel 6.15-rc5 bpf selftests on Loongarch machine
> > running Fedora, the bpf test programs seems built ok, but I got
> > liburandom_read.so build error below:
> >
> >   LIB      liburandom_read.so
> >
> > /usr/bin/ld: cannot find crtbeginS.o: No such file or directory
> >
> > /usr/bin/ld: cannot find -lstdc++: No such file or directory
> >
> > /usr/bin/ld: cannot find -lgcc: No such file or directory
> >
> > /usr/bin/ld: cannot find -lgcc_s: No such file or directory
> >
> > clang: error: linker command failed with exit code 1 (use -v to see inv=
ocation)
> >
> > make: *** [Makefile:253:
> > /usr/src/linux/tools/testing/selftests/bpf/liburandom_read.so] Error 1
> >
> > Am I missing  gcc tools for Fedora loongarch?
>
> This is related with the cmake option when compiling Clang:
>
>    "-DLLVM_HOST_TRIPLE=3Dloongarch64-redhat-linux"
>
> You can native compile and update your Clang like this:
>
> git clone https://github.com/llvm/llvm-project.git
> mkdir -p llvm-project/llvm/build && cd llvm-project/llvm/build
> cmake .. -G "Ninja" \
>           -DCMAKE_BUILD_TYPE=3DRelease \
>           -DLLVM_BUILD_RUNTIME=3DOFF \
>           -DLLVM_ENABLE_PROJECTS=3D"clang;lldb" \
>           -DCMAKE_INSTALL_PREFIX=3D/usr/local/llvm \
>           -DLLVM_TARGETS_TO_BUILD=3D"BPF;LoongArch" \
>           -DLLVM_HOST_TRIPLE=3Dloongarch64-redhat-linux
> ninja -j4
> sudo rm -rf /usr/local/llvm && sudo ninja install
> export PATH=3D/usr/local/llvm/bin:$PATH
> export LD_LIBRARY_PATH=3D/usr/local/llvm/lib:$LD_LIBRARY_PATH
>

Thanks Tiezhu!

Below is what I used, it looks like I missed the "lldb" in
LLVM_ENABLE_PROJECTS, I will add that.

cd $(DIR_APP)/llvm && mkdir build

cd $(DIR_APP)/llvm/build && cmake .. -G "Ninja"
-DLLVM_TARGETS_TO_BUILD=3D"BPF;LoongArch" \

-DLLVM_ENABLE_PROJECTS=3D"clang"    \

-DCMAKE_BUILD_TYPE=3DRelease        \

-DLLVM_BUILD_RUNTIME=3DOFF \

-DCMAKE_INSTALL_PREFIX=3D/usr \

-DLLVM_HOST_TRIPLE=3Dloongarch64-unknown-linux

> or install the fedora 42 and then use this software repo:
>
> https://mirrors.wsyu.edu.cn/fedora/linux/F42/rawhide/Everything/loongarch=
64/iso/

good to know, I will upgrade when I get chance.

>
> Thanks,
> Tiezhu
>
