Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458CA239E8B
	for <loongarch@lists.linux.dev>; Thu, 12 Jun 2025 12:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749731129; cv=none; b=U0464x8yHlRaFTmZWzv6/SOw7KVGL/mQ9SOlk476Vh2ADtg8jSp+LSKluU5t8KqXn2URnvo6Nho6qav9ZOPhhdRmz5dKOxcciUED73ukkVI9HXqlBNDkyKBcOF36Z+pMG+3S+mhtnrzEH/YwxzEumndQGfXN9Uvo9yHTqtByqkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749731129; c=relaxed/simple;
	bh=JXwgAcbGOHl30Yf9+6YfhbmmIhPZTGgI/Mog56++6Fc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AdiuNclU5LX8HgJZvd86QEggCeKvKh55NwxFxjIr416s+lpetSULaz7aAbKPO+HOZ5yUOecn2dGAmALirdtOD1oJwVA0t0uAC43cUC1eFyJGOScCIROWUPfAcZrIVWUmNmjxbMztrYTTujCUym4U2DAhnjl0RfRLknLRSP3D4r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hveNMpx7; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hveNMpx7"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2d0920ce388so385461fac.0
        for <loongarch@lists.linux.dev>; Thu, 12 Jun 2025 05:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749731127; x=1750335927; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GY33gDSZqkXWF6CTWrwX25ZqOO0EMy6T3oHny9a6RNc=;
        b=hveNMpx7gKKmNZKGYCgeiwXH2H6SwhE3hmWXh3hh9xgOrGLT3/W0BFeuXlDMqiWWTd
         +yNiv/VXejuIJEA6f2nUqR1CPtDTGrY8kJFqZURHGdKhfGgTknbw6kgzId3VDmBz79UA
         QAz2E0dowEA6sSEbpQ/Uq9lKZPeiJHGolMfgEgY0qAbG4qYGFdg/TiFzeLXLIFwB86P+
         eulGUFTINJcvYT7lp1PW4qOAoaJ64nzHlNGImstB4gfEPQ73NmBYx9TA/5yGqXAhSyrn
         7of2tyP0ZRzpa15rlnIXcYhtE+RnhjDSA4NctSQYGE3x42isK+OqBYXf17rePBVRzuVM
         c1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749731127; x=1750335927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GY33gDSZqkXWF6CTWrwX25ZqOO0EMy6T3oHny9a6RNc=;
        b=PwBw71wFqSOdYHZcIRTGzENmDXfhUFcypFrrzJzV6s4TeAmCOJNGzIeQhJ22lFyaV6
         3j817MlzK8zc0YM3aYsxc6qX3/jV7e6gW8lgt//hkgWieSrfaBRdqrUoj5n/tgj5W7rI
         wFsNoPsh6vcnlA6oU+dRqvQ2EfuKiNLytCsFAgC+hmqZ86ZwYcMVi/fugx6xOKibW7qK
         EPSZ9SC44hzAGFwdcEenRIvj1bfI78zWCYqY0vBiomWDhfUkWRH18xWwpMvR+/ryMODs
         yKcPnjNqeOJw1En/gQP8+OiwYDK2i/r3voOM6NSOHyO0iooN1KIu4b6+HAU69Xv9Gx+y
         kObA==
X-Gm-Message-State: AOJu0YxsJD6RtPRIs3AuPdZivsXljcKuU980rVkrNExpR/q/aLDiYe5r
	JbqxUJ623jAcXTr3LdxAtyuoybmrqGwtBtDbDgn9/X6pHqq1Vqza45ZMzTIZaAkiNiYbRW6CRlt
	zDVccADd6UPktLWwh96Sr9gIATSqxPsI=
X-Gm-Gg: ASbGncv1lEj55NDNllmBIIjKnvH2GD0xqcu0oMMFwPZoSJz7+gmr+7JPat+DCtlholF
	FfuaMClgM3RAtVFk3u7nij+wqI2e8Sa9e6AhZgNpPgfSeXjDeohAIIYS+1mfDWtW/5w36P7w1SQ
	c5MetpAqCnaLKmDMjVz1m8/k69vBz/OBFj0D6ljQ7p75Q=
X-Google-Smtp-Source: AGHT+IGGhlN+SBM3ZCFzB5W5cBPTJnocMj4LP2gu2bOKGUnIv2Vgfl3daUM8zcIk5aqXZp1fnYyhd4Mg5cJiahujj0E=
X-Received: by 2002:a05:6870:4f15:b0:2e9:973c:98c3 with SMTP id
 586e51a60fabf-2ea96c3cfe8mr4412999fac.10.1749731127174; Thu, 12 Jun 2025
 05:25:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250611035952.111182-3-duanchenghao@kylinos.cn> <20250611053625.352091-1-duanchenghao@kylinos.cn>
In-Reply-To: <20250611053625.352091-1-duanchenghao@kylinos.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 12 Jun 2025 20:25:16 +0800
X-Gm-Features: AX0GCFuKnFcP-3g16LpNTg2u3fKoOMbooK8Md66fugU6VUBlnVmG3Na12-QOeR0
Message-ID: <CAEyhmHRguzXRnMGc3SQV-cwe7vtXVEPzKicZU-Gxq93_UmRX+g@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Support trampoline for LoongArch
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: loongarch@lists.linux.dev, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Vincent Li <vincent.mc.li@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 1:36=E2=80=AFPM Chenghao Duan <duanchenghao@kylinos=
.cn> wrote:
>
> v1: Support trampoline for LoongArch. The following feature tests
> have been completed:
> 1. fentry
> 2. fexit
> 3. fmod_ret
>
> TODO: The support for the struct_ops feature will be provided in
> subsequent patches.
>
> Chenghao Duan (4):
>   LoongArch: BPF: The operation commands needed to add a trampoline
>   LoongArch: BPF: Add bpf_arch_text_poke support for Loongarch
>   LoongArch: BPF: Add bpf trampoline support for Loongarch
>   LoongArch: BPF: Update the code to rename validate_code to
>     validate_ctx.
>
> George Guo (1):
>   LoongArch: Support fixmap
>

Finally, I realized that this v1 series is sent 3 times :(

Some general feedbacks on the series:
  * Please cc the BPF mailing list on next respin (BPF has a patchwork and =
CI)
  * Reword/refine the commit messages (e.g. describe your changes in
imperative mood, AI is useful)
  * Format the code according to kernel coding style

>  arch/loongarch/include/asm/fixmap.h |   2 +
>  arch/loongarch/include/asm/inst.h   |  19 ++
>  arch/loongarch/kernel/inst.c        |  85 +++++
>  arch/loongarch/kernel/setup.c       |   1 +
>  arch/loongarch/mm/init.c            | 111 ++++++-
>  arch/loongarch/net/bpf_jit.c        | 497 +++++++++++++++++++++++++++-
>  arch/loongarch/net/bpf_jit.h        |   6 +
>  7 files changed, 714 insertions(+), 7 deletions(-)
>
> Signed-off-by: Chenghao Duan <duanchenghao@kylinos.cn>
>
> --
> 2.25.1
>
>
