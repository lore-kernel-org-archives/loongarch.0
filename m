Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5378F238C16
	for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 16:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754929273; cv=none; b=eaR5BFs9ddavfB5BBm67lH7PsZ/rCzS7hBoEPMwD4wZkc+OKJ7InyXhENQk8og00PDcvyX8sHHmhiigYVD3qU4vdl4l1y/oA+M95gdCrNL78K/hpuK402Qhy4VG1kauCOX6TeF1d8OPzurZmqGmre090epj5D8d42Oy9x60sFE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754929273; c=relaxed/simple;
	bh=s5bt6GFiE6bMNBu/lzmSJYG/tNT+JL+uAYtxA5bAwHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dJto6nYTy4FXHBwpxM7sVEZ61vTmyBO2lByd/Zsk/g6JkoFvcCQJ7hVgMfBaIa5+8e03LtKNBnGRN0VtDBTDaCpXZagyNwlI6kpI9PXnWpZzjzelq+EyhL8PjsI+KuFeZUWz6DNFPC8JpS7M6fC5lr6ApPCdCE8Xp78L0ScLxGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3zYKoOI; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3zYKoOI"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4af14096b9eso60341621cf.3
        for <loongarch@lists.linux.dev>; Mon, 11 Aug 2025 09:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754929271; x=1755534071; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awL0JISook8hWw9o6aqgJ55OTTrQ762wx6oz1JCvYrA=;
        b=K3zYKoOI5fdVpdhDDma4e6PGOzNmqwFLgyRBOw1cqsNsEPl5bU5M4wplhxgMoJrS9Z
         3WNsb39ChlnmPVhEixb04cOsq13BqZ9sJV/PPIJ3nbgxhJUJ9lvc13/hXqWPJs8TJsGq
         smkQqtuc++na5wjDodQOe0By1AqiK6vI0OUlPNDUBWzxLJMTiTDVf6I7Y9RBlzoMvKVn
         ai3/daVuBmbSxj/A+hcvsnSsAug5W0fehJLFEGR7773I4HqhQl4UUdF9ffInLdgIlVGI
         CvpZlrHRJHSd6/kewgcbPy9f3bHo5i3lvs9eAp7jTrD3DvgDr0iroACBQtZme9uTRpeE
         x4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754929271; x=1755534071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awL0JISook8hWw9o6aqgJ55OTTrQ762wx6oz1JCvYrA=;
        b=B4hp0zRoy6G7dCsXKvrNcdQ7hrneA5bj0Muj3sTmlzxJtzVPT4deROVeC/IsBHE994
         3Jlk11w2rhMd1C3ogyDVikZRgWx85HmsuL8bmW72EJhg/kgL5o72VtbLAPr+31rvvZjF
         btpZI7xQ+DckVPl/HlWMnMKIG03WY7ohjqPNsvcuQsBNd8oEmydA3MJYvDb/zGbxXqfJ
         tdg4+iUBy6oUpMMid3ubov6a2N3WhRGJ54JaEgellqGju658PYPZom7y+A/3PBxrIfy/
         tKEhTRPc8QUw+JobF0IiItFCShKJaIOTKNnlMs1dpZwwKIRdcR5OYoJIT24Owl4uQyii
         NnNg==
X-Forwarded-Encrypted: i=1; AJvYcCUcCFNvoImNHlj6o0ACVhsWMopeg7NVex/1hZTBrV6bOJYQNWbjiAYKIn/v183oFDY7dY0XwGieb9w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2R1XVYLDfYxAmquGBU2Drnvww+DIfP7MZbVfd4Wn1DRwQ4MYw
	nraF029t87QY5YK4i6n7ZmoIpQ9R070+1XXf7dI6XD9/h6d9mWrbqmD82zaA/Vq3DrdhqvT4nrO
	2M5KFMu3SU+qt/RigN76DTxdjvRNGxQqj5A==
X-Gm-Gg: ASbGnctQICslep0nY/xF8INYklNVE8/oOshgdDlrW/wOLZL9XqaRX9FisJFXTVOPO0f
	k5uAcIAtZrXukNXjkGaAWhmeg43DstDB09pfe/0MEG7Sn6Ii8qRpSD5tsOiyUVbst7MJ3qm2QuG
	vXdQbS1/yU7tCoO6yDqAHs1C9XdxMGUMRKnpKWqIfqtLlZZNZMo8dNNCPiL1XoaM+RqGPf6quyZ
	5ZKll0=
X-Google-Smtp-Source: AGHT+IEDpLTv7rwI0cAD28QFliIQ+yhsQyc/LNmqJsRa+8ZnXDomS0x3dmlWYN6EUAqJkku1zV2hhhFk3Xiacn8G2Ic=
X-Received: by 2002:a05:622a:246:b0:4b0:6d53:a0fc with SMTP id
 d75a77b69052e-4b0ecba90cdmr1727651cf.7.1754929260980; Mon, 11 Aug 2025
 09:21:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250811092659.14903-1-youling.tang@linux.dev>
In-Reply-To: <20250811092659.14903-1-youling.tang@linux.dev>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Mon, 11 Aug 2025 09:20:49 -0700
X-Gm-Features: Ac12FXzUld0iGaUsswbNzvqcYCLYuSpImt4hSWuMJKJTIUip4EMBCi_zM0pJ_tc
Message-ID: <CAK3+h2zXBcAgtWJLXhAzzTZQ6_7Epqc6HuOassm_o5JAftK+Gw@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add kexec_file support for LoongArch
To: Youling Tang <youling.tang@linux.dev>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Youling Tang <tangyouling@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Youling,

On Mon, Aug 11, 2025 at 2:28=E2=80=AFAM Youling Tang <youling.tang@linux.de=
v> wrote:
>
> From: Youling Tang <tangyouling@kylinos.cn>
>
> This patchset implement kexec_file_load() support on LoongArch.
>
> This patch series enables us to load the LoongArch vmlinuz.efi or
> vmlinux.efi by specifying its file decriptor, instead of user-filled
> buffer via kexec_load() syscall.
>
> To use kexec_file_load() system call, instead of kexec_load(), at kexec
> command, '-s' options must be specified. kexec-tools needs to apply the
> corresponding patches. These patches can be found in repository [1] and
> will be submitted to the kexec-tools community later.
>
> The basic usage of kexec_file is:
> 1) Load second kernel image:
>  # kexec -s -l vmlinuz.efi --initrd=3Dinitrd.img --reuse-cmdline
>
> 2) Startup second kernel:
>  # kexec -e
>
> For kdump:
> 1) Load capture kernel image:
>  # kexec -s -p vmlinuz.efi --initrd=3Dinitrd.img --reuse-cmdline
>
> 2) Do something to crash, like:
>  # echo c > /proc/sysrq-trigger
>

I am new to this feature but I am interested to test this feature, How
do I get the second kernel or capture image vmlinux.efi and
initrd.img, do I need to build them separately and how?

> Link:
> [1] https://github.com/tangyouling/kexec-tools/commits/main/
>
> Youling Tang (6):
>   LoongArch: Add struct loongarch_image_header for kernel image
>   LoongArch: Add kexec_file support
>   LoongArch/kexec_file: Add initrd loading
>   LoongArch/kexec_file: Add crash dump support
>   LoongArch/kexec_file: Add "mem" parameter to limit memory usage of
>     kdump kernel
>   LoongArch: Enable CONFIG_KEXEC_FILE
>
>  arch/loongarch/Kconfig                     |   8 +
>  arch/loongarch/configs/loongson3_defconfig |   1 +
>  arch/loongarch/include/asm/image.h         |  58 +++++
>  arch/loongarch/include/asm/kexec.h         |  12 ++
>  arch/loongarch/kernel/Makefile             |   1 +
>  arch/loongarch/kernel/kexec_image.c        | 112 ++++++++++
>  arch/loongarch/kernel/machine_kexec.c      |  33 ++-
>  arch/loongarch/kernel/machine_kexec_file.c | 234 +++++++++++++++++++++
>  8 files changed, 448 insertions(+), 11 deletions(-)
>  create mode 100644 arch/loongarch/include/asm/image.h
>  create mode 100644 arch/loongarch/kernel/kexec_image.c
>  create mode 100644 arch/loongarch/kernel/machine_kexec_file.c
>
> --
> 2.34.1
>
>
