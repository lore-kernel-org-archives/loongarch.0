Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B2C1E0B9C
	for <loongarch@lists.linux.dev>; Tue,  8 Jul 2025 01:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751938575; cv=none; b=idTVmtO4J64bEjRa4NBF5ZGpWGiykKkTDFoAQXRFsyF4SaDhihCLKfBc0nU599H+X0X2cJGfkGBmde0ytQgwB1XkLBpiLn9oVIBTs2+gZ/rfhAIZzKSF2QSSeSyuVC8ySKWXE4C42Ml7d2DKp7qTOXfvdxSHPCeN6qjUzviLqTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751938575; c=relaxed/simple;
	bh=mPdHDnsSbrlffFtKsuK3PZCDIhU4cAP9syp1+yii++M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UAIaFPklCWfgnpjpOIFmTHtao6bTGIUcwqE8GKyeCysuqAuYIlG/MkaTn9WikEisD3uQsfJy+f7a5s3znp3OAVeU3OvWNY3TbjhKQRvn866EZ1pghHdI8fibhl+fQs28A//xHz7KVm5LvzDNwDszRtTvdnzK5+Ez9i2eUnwBbbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GFPoT4wI; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFPoT4wI"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-40aef72f252so1027294b6e.0
        for <loongarch@lists.linux.dev>; Mon, 07 Jul 2025 18:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751938573; x=1752543373; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZrTVjvGly2L/LnsPLWxtjOU2megBnWr13nVYJkRJptY=;
        b=GFPoT4wIJ237Jo6eZeIo4oe4UCVBgHxL51IOEoDqoYFotrs5ps1dyF0C4hvWaJ24hV
         EJpq42Nb+5oOgaJON5M5/KcaF//e7A9QJzxR4PLKSzDWc6RxTRiPni2ZLwH4zs0sYanh
         +1g4cZ3B8C/ZH7KxhnwY6dsQLySAvW8yP/jxKzHwetXfPlO5j286J3JgaoZbuAVKCUHa
         YTSf9yBi+TZpbMleTrr+IPcEIjIBvtcwNLFKYesa8FRd8iGL1VNKneq/Emj5kILjJeAO
         ejij9F1p7qGvpubBT1QsfEBJ9tPF/GMpTgLIGDBVjnNujaYAhQ87YC+HUDmEIouR80uC
         8CKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751938573; x=1752543373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZrTVjvGly2L/LnsPLWxtjOU2megBnWr13nVYJkRJptY=;
        b=v/roP7VNfPvbfOcHsSIUooadhSOqQHWYq6DeKfhJbTKATl2egrqsQmueE95UgwvvXa
         lTWsSkTLXZZZEooe/IsDT8P1Drw8hn314a8nNIdLABRu9TDJMljtB/d5tgIVW73vbesI
         hixKwfbbGJNX7LVYa1W+hr7d1+kGlNfpN4Tvcndp05Q7foaiVZmCXJo9GKsAdiIoYy2H
         zPOJ+lm/k8U+SJGvU3OCZ5zcJCeL236u0ksLAOxgrIPnq4sZMoYHEC/KTEoFQF+5GdNg
         estuI2kUqM4/5YuPb1jKiOthXHybcxF2uHc/vxdZoyEbH5NUGK9PY563f4qj52YEiAgK
         DWiw==
X-Gm-Message-State: AOJu0YyHebDSoNZr6VhsUtu3imgW7UbRarIwP207HAYyefxfnYQ8sQB0
	iWmvGMKXGGurQGE5jAWlvCqZGLGOZgSypj6KG2jlivXNnBf1r8m7YyhCoBIrO4MjOMSDi9uDIgm
	pa5GYJLHOFM9HEu5NDtW7c6vF6bn3LpU=
X-Gm-Gg: ASbGncv7v3ejGp/Tz5G+qzlRjPcl0z86gZUe9AIM06zhU9Iur0uRYkU1WhYKkiElBJ5
	7HdhvjrBMgzsE9B/LFoAdbUNLIJrKoI5jknZEQ05FsFTtU/u9vHiL5WZh2YuLXsT40DIlji54qh
	RazVfyUZvnKq0oqEgnahdUEeDrAA9svwOrtgy4C9faJ98=
X-Google-Smtp-Source: AGHT+IFAugfJRnrBMxyoi2p/C/6NM3kBFO0FRMDv8490JJP4LvOKOrIAJltu88jijp8nn8vL+HAlWrjUsJF7clbg6/U=
X-Received: by 2002:a05:6808:50a4:b0:408:e711:9aa with SMTP id
 5614622812f47-4113f6434bemr827129b6e.37.1751938573138; Mon, 07 Jul 2025
 18:36:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250701074110.525363-1-jianghaoran@kylinos.cn>
 <CAEyhmHSzfMr0J4t7v7cC7roTfybJRqHF_iumFMCYm_iqzJkGOQ@mail.gmail.com> <d61697244565d2c423fdd965decc4fcd0a3a8f74.camel@kylinos.cn>
In-Reply-To: <d61697244565d2c423fdd965decc4fcd0a3a8f74.camel@kylinos.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Tue, 8 Jul 2025 09:36:02 +0800
X-Gm-Features: Ac12FXyQhWH9XzoMAPXYfUVao4ZzM6XCFtGrI9gAVikvpaqWQ5JnzJhYGf7vf4Y
Message-ID: <CAEyhmHQnmzX_-PpWsg+WcesJuO6pn5ZGBLYvzAXSBtKnGQpjmg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix two tailcall-related issues
To: jianghaoran <jianghaoran@kylinos.cn>
Cc: loongarch@lists.linux.dev, bpf@vger.kernel.org, kernel@xen0n.name, 
	chenhuacai@kernel.org, yangtiezhu@loongson.cn, jolsa@kernel.org, 
	haoluo@google.com, sdf@fomichev.me, kpsingh@kernel.org, 
	john.fastabend@gmail.com, yonghong.song@linux.dev, song@kernel.org, 
	eddyz87@gmail.com, martin.lau@linux.dev, andrii@kernel.org, 
	daniel@iogearbox.net, ast@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 1:53=E2=80=AFPM jianghaoran <jianghaoran@kylinos.cn>=
 wrote:
>
>
>
>
>
> =E5=9C=A8 2025-07-03=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 20:31 +0800=EF=
=BC=8CHengqi Chen=E5=86=99=E9=81=93=EF=BC=9A
> > On Tue, Jul 1, 2025 at 3:41=E2=80=AFPM Haoran Jiang <
> > jianghaoran@kylinos.cn
> > > wrote:
> > > 1,Fix the jmp_offset calculation error in the
> > > emit_bpf_tail_call function.
> > > 2,Fix the issue that MAX_TAIL_CALL_CNT limit bypass in hybrid
> > > tailcall and BPF-to-BPF call
> > >
> > > After applying this patch, testing results are as follows:
> > >
> > > ./test_progs --allow=3Dtailcalls/tailcall_bpf2bpf_hierarchy_1
> > > 413/18  tailcalls/tailcall_bpf2bpf_hierarchy_1:OK
> > > 413     tailcalls:OK
> > > Summary: 1/1 PASSED, 0 SKIPPED, 0 FAILED
> > >
> > > ./test_progs --allow=3Dtailcalls/tailcall_bpf2bpf_hierarchy_2
> > > 413/23  tailcalls/tailcall_bpf2bpf_hierarchy_2:OK
> > > 413     tailcalls:OK
> > > Summary: 1/1 PASSED, 0 SKIPPED, 0 FAILED
> > >
> > > ./test_progs --allow=3Dtailcalls/tailcall_bpf2bpf_hierarchy_3
> > > 413/24  tailcalls/tailcall_bpf2bpf_hierarchy_3:OK
> > > 413     tailcalls:OK
> > > Summary: 1/1 PASSED, 0 SKIPPED, 0 FAILED
> > >
> >
> > Thanks for the fixes. Will review this series soon.
> > BTW, do you test other tailcall test cases ?
> >
> > Cheers,
> > ---
> > Hengqi
> >
>
> tailcall_1/tailcall_2/tailcall_3/tailcall_4/tailcall_5/tailcall_6/t
> ailcall_bpf2bpf_1/tailcall_bpf2bpf_2/tailcall_bpf2bpf_3/tailcall_bp
> f2bpf_4/tailcall_bpf2bpf_5/tailcall_bpf2bpf_6
> /tailcall_bpf2bpf_hierarchy_1/tailcall_bpf2bpf_hierarchy_2/tailcall
> _bpf2bpf_hierarchy_3/tailcall_failure
> These test cases passed
>
> tailcall_bpf2bpf_fentry/tailcall_bpf2bpf_fexit/tailcall_bpf2bpf_fen
> try_fexit/tailcall_bpf2bpf_fentry_entry/tailcall_bpf2bpf_hierarchy_
> fentry/tailcall_bpf2bpf_hierarchy_fexit
> /tailcall_bpf2bpf_hierarchy_fentry_fexit/tailcall_bpf2bpf_hierarchy
> _fentry_entry/tailcall_freplace/tailcall_bpf2bpf_freplace
> These test cases depend on the trampoline capability, which is
> currently under review in the Linux kernel.
>

Please post the full test result of the tailcall test cases for future
references.
We can safely ignore those ENOTSUPP cases. Thanks.

> These two patches are relatively independent. Could we prioritize
> reviewing the fixes above first?
> Trampoline-dependent changes will be implemented after
> trampoline  is merged.
>
> thanks
>
> >
> > > Haoran Jiang (2):
> > >   LoongArch: BPF: Optimize the calculation method of jmp_offset in th=
e
> > >     emit_bpf_tail_call function
> > >   LoongArch: BPF: Fix tailcall hierarchy
> > >
> > >  arch/loongarch/net/bpf_jit.c | 140 ++++++++++++++++++++-------------=
--
> > >  1 file changed, 80 insertions(+), 60 deletions(-)
> > >
> > > --
> > > 2.43.0
> > >
>
