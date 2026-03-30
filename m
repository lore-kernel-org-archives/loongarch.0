Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A06626E71E
	for <loongarch@lists.linux.dev>; Mon, 30 Mar 2026 03:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774842465; cv=none; b=kfi9rh3SlcyQ+90QH4XBKQK6y6d1qTbmPy1AWT7bQDBwU0XOnNXgDOZ2zRtzCFH7xoGeKOFgnVj9sC8uMUI2uV1kOi6B5X33+YuZzZ1ydfU08Ba1NJsltk+SDFohsWqd6wgKp0zvVtUagwNpf9zlXyOG7B68h4OqhiEGLGs4u5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774842465; c=relaxed/simple;
	bh=nbn+1wU01z27PHPiB6pyjlcWzi6QRevgboBAEreZK0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aAMNGm86Oa0rDbrMOC0jJ7bqf/PBQLLCwsEPoeV842V38yA5fM03u943ExqiKH0maPOZzIneOQW0XHlWqPTH8LF40Fw9q/p/JLb1C6Fc8gKPXafHkOBxpeOOzLPq/AseaMblxja63aG+38XHtZ+WjGwTXPoSm8vtQH3A82G8mQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Scb0MZjy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Scb0MZjy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CDD5C2BCB7
	for <loongarch@lists.linux.dev>; Mon, 30 Mar 2026 03:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774842465;
	bh=nbn+1wU01z27PHPiB6pyjlcWzi6QRevgboBAEreZK0g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Scb0MZjy9cW04DoU9XXgbCQXHVOKa8DZVHDYfIiIKz2Fqgl3FbLxeTL5wH1FsnBpY
	 bDiVv31JMHV56ZOzGCkfJIHGhtdSgwDDoOdmQZHEVQJr0OiUIlyPhAzciiHFsWHUE5
	 yOl5buCFMT8PBAhOjjBMBO9ikE5Iebn/0Ej0dSz4tPpx94aoiMHtf1yBtqO3rFwQOq
	 7F3RSd6YK57Ou0xLcJTTjr8bkmKSvHsISlzMFKdyUGKweTQfm0r1NvzqhVLExwzHGA
	 TF+qUuaMfIQSuIAcVONoEBik/na74YLUlofcP75mpWWxJS29GiNl6QhjqFIjVRgmQm
	 EvkNHCPAr+0FQ==
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43ccda008cdso977008f8f.0
        for <loongarch@lists.linux.dev>; Sun, 29 Mar 2026 20:47:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWk5pv+QBF1J+safImby4BMD3WOdvplUPnxENbZib5/ZgMTXVKgB9T/zR3/5ZowgTawJtPEXF8F4W0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwNLOSEejbkyLVhIl3nm0WU5JL1IUNeSGPNDSBJrUbeNupjkfn
	crymhHwJHISg6OOozcmo+2AWks06H9IX1oW2qFK0EmvnEJbpylGqxZizRxCRNZKo41DanttwtIk
	rcMaq3Goav4CdCaWwTEgeBo6SEnN2qL8=
X-Received: by 2002:a05:6000:1a8e:b0:43b:45c6:7ad with SMTP id
 ffacd0b85a97d-43b97a90decmr23305904f8f.29.1774842462488; Sun, 29 Mar 2026
 20:47:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260328074013.3589544-1-ruanjinjie@huawei.com> <20260328074013.3589544-6-ruanjinjie@huawei.com>
In-Reply-To: <20260328074013.3589544-6-ruanjinjie@huawei.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 30 Mar 2026 11:47:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQu0ekP6Emz=F3uEhPsyqNvH_PwwJU5yOADbR9poQ4noQ@mail.gmail.com>
X-Gm-Features: AQROBzBPJeJ2Q-LIGCNdFWKdGbP9VQWOujey1zE68GwImpeUgj1lBD6fgh2uH4Y
Message-ID: <CAJF2gTQu0ekP6Emz=F3uEhPsyqNvH_PwwJU5yOADbR9poQ4noQ@mail.gmail.com>
Subject: Re: [PATCH v11 05/11] riscv: kexec_file: Fix potential buffer
 overflow in prepare_elf_headers()
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com, 
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org, 
	saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com, 
	vgoyal@redhat.com, dyoung@redhat.com, rdunlap@infradead.org, 
	peterz@infradead.org, feng.tang@linux.alibaba.com, 
	pawan.kumar.gupta@linux.intel.com, dapeng1.mi@linux.intel.com, 
	kees@kernel.org, elver@google.com, paulmck@kernel.org, lirongqing@baidu.com, 
	rppt@kernel.org, leitao@debian.org, ardb@kernel.org, cfsworks@gmail.com, 
	osandov@fb.com, jbohac@suse.cz, tangyouling@kylinos.cn, 
	sourabhjain@linux.ibm.com, ritesh.list@gmail.com, eajames@linux.ibm.com, 
	songshuaishuai@tinylab.org, kevin.brodsky@arm.com, vishal.moola@gmail.com, 
	junhui.liu@pigmoral.tech, coxu@redhat.com, fuqiang.wang@easystack.cn, 
	liaoyuanhong@vivo.com, chenjiahao16@huawei.com, hbathini@linux.ibm.com, 
	takahiro.akashi@linaro.org, james.morse@arm.com, lizhengyu3@huawei.com, 
	x86@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 28, 2026 at 3:41=E2=80=AFPM Jinjie Ruan <ruanjinjie@huawei.com>=
 wrote:
>
> There is a race condition between the kexec_load() system call
> (crash kernel loading path) and memory hotplug operations that can lead
> to buffer overflow and potential kernel crash.
riscv left no margin for hotplug in prepare_elf_headers(). Actually,
this check has been in crash_exclude_mem_range(); this patch makes it
happen earlier.

Although this patch has no real effect for riscv for the current. I
still give an acked-by, because it's a proper check step in this
callback.

Reviewed-by: Guo Ren <guoren@kernel.org>

--=20
Best Regards
 Guo Ren
