Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4678B38384
	for <loongarch@lists.linux.dev>; Thu,  3 Jul 2025 12:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751545923; cv=none; b=SYTPp87tyjCXJmnhrArtRtoB5YHWH08A3COD4mcFAzRfgc/Wg4crhzeAJ2gG68/tq4/ibNH3xznDKDMBkl+c2eBEgmARyUGviCJ7fe3mQBqBaidyrwH+Ogc5tDYhElEh+yXF7uQmoa091i08h73gnIHy3ZmXOcP+j3q8orFaF0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751545923; c=relaxed/simple;
	bh=S4J99fobTBLE1mv7fNytEpG9fmSZtcD/mHmVfzYtlyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RMSUYWzhtpqHY2MwpUOW3kohcY6da0K7GQm2+UWpxsYUzrCaDh9s6rEMNM+dQ4EOSHMfW7oClPtw/qjRA2ZeK8WXkBXrX2+IEMqrXBuzi48MGqQ1X2SKl6qhAFloAGAwKOvvP0yMzfFwfpDw1td+uIrhI8zWuknFCobOLymPiPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDstoUk3; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDstoUk3"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4067ac8f6cdso3949362b6e.2
        for <loongarch@lists.linux.dev>; Thu, 03 Jul 2025 05:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751545921; x=1752150721; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQhKbDgttLDPzwjksoiTuICCO43hP51+1t35DHSJJzk=;
        b=IDstoUk3BLvglMOJ9IdJY63/fR3V/MBKsaM2F1jfblFiYhu1p7B7yJcXKZ1FDyV5PA
         kj6fE7sv80KWBZpI6lXvGxd9pOfhbl5KpOms+lfQw83orgr+Alf9sf3uznVowNRjcToA
         Qqp7xKIOyXFO0NUvmy2FLpPJNfl6PheEazPqXkMNqUdsm+TYT71k9IBTK4NffN89+F7K
         K43EPVHmzHTeu4/jJxLdUE70bFDWlchPHCo4WQfyucZTt9dv4MEhLG+38JMIS6WZ1GUR
         xQrIXPvXiCzSndIs0W5bFY1/F9O61kq4gfvCAYeFjSJCFIkbwvR1mRGl77bxD/FvkPB5
         w3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751545921; x=1752150721;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQhKbDgttLDPzwjksoiTuICCO43hP51+1t35DHSJJzk=;
        b=nZlfr4LQ/rUTtV2AyxACdXBKWxWjnVqARIx/Qxnwf21S/evQITpzkmZGafrVVnjBc5
         RIcgHjuhiSXH0d/CEMLsNR+0DyZXQMEJuMuKhc/jcREWqYvpvwrQj4hbkyZNPfklObt7
         Uqfbp/WP31bC2aQvw1d2BKc4YsPSiBGsBo/iqsY+CZnwgd7/NYNb0y0+zD8FpUKyCvZh
         H8uz3t6D5vTElPml4kEV/gKHcuAG+SD76FKJdSyOXgJBWFZ7yRSiqSGjL/oZ6MC0BcBr
         h1TqmlEzXinpJJAVLvQttRDTP9dsBF3nn/038eien00xXEn4yPLVVLXGZaxV6dCuC46t
         XtwA==
X-Gm-Message-State: AOJu0YwYzJeDW/qG1dHHv9poAADVdMfvMGmXWDky/MI7f1oQX+NZNIus
	MsHsy0g7SH/Vw4e3NDeYtZYUFuQltdrU25Ql+VAVA92YxxES/ylp2VirMYG00cmSnLqwZQ8WYtS
	EM0TMc1104SIoGCaVfcMToYBGg1JiRKs=
X-Gm-Gg: ASbGncte8ZJeHK14MmmrExYOdZHqo1rQmDkFCiZWbnV58nfA8eyh0HntnHYeFq/Ja81
	COHhHZIrMYdx7MSVhse0J++fuemSRyEg2XAdAH0ksKCbXFoeaEVtlHGzB5FH6f2LcGPX3MuZUTe
	tg+V/XmCeXA149IHo+BtD4x0ewcpZW1AGlNZQoLvixuKgIG2rvEEmMlQ==
X-Google-Smtp-Source: AGHT+IHKgh3LV0M1b1DI8XB7Kt26yf3bzmbWqoLaHD9ywjP2Z87i/kydkVEv0FPDtA2B1qW1o+7wGN53vA5wbK1o1BM=
X-Received: by 2002:a05:6808:1708:b0:406:72ad:bb6b with SMTP id
 5614622812f47-40b8932e380mr4527700b6e.37.1751545921313; Thu, 03 Jul 2025
 05:32:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250701074110.525363-1-jianghaoran@kylinos.cn>
In-Reply-To: <20250701074110.525363-1-jianghaoran@kylinos.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Thu, 3 Jul 2025 20:31:50 +0800
X-Gm-Features: Ac12FXzvOvSPQVT9LYj0iv4FoFZsh-_TM9rl_-KtrPi7ZPAloYrcp2RmxBqM7-M
Message-ID: <CAEyhmHSzfMr0J4t7v7cC7roTfybJRqHF_iumFMCYm_iqzJkGOQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix two tailcall-related issues
To: Haoran Jiang <jianghaoran@kylinos.cn>
Cc: loongarch@lists.linux.dev, bpf@vger.kernel.org, kernel@xen0n.name, 
	chenhuacai@kernel.org, yangtiezhu@loongson.cn, jolsa@kernel.org, 
	haoluo@google.com, sdf@fomichev.me, kpsingh@kernel.org, 
	john.fastabend@gmail.com, yonghong.song@linux.dev, song@kernel.org, 
	eddyz87@gmail.com, martin.lau@linux.dev, andrii@kernel.org, 
	daniel@iogearbox.net, ast@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 3:41=E2=80=AFPM Haoran Jiang <jianghaoran@kylinos.cn=
> wrote:
>
> 1,Fix the jmp_offset calculation error in the emit_bpf_tail_call function=
.
> 2,Fix the issue that MAX_TAIL_CALL_CNT limit bypass in hybrid tailcall an=
d BPF-to-BPF call
>
> After applying this patch, testing results are as follows:
>
> ./test_progs --allow=3Dtailcalls/tailcall_bpf2bpf_hierarchy_1
> 413/18  tailcalls/tailcall_bpf2bpf_hierarchy_1:OK
> 413     tailcalls:OK
> Summary: 1/1 PASSED, 0 SKIPPED, 0 FAILED
>
> ./test_progs --allow=3Dtailcalls/tailcall_bpf2bpf_hierarchy_2
> 413/23  tailcalls/tailcall_bpf2bpf_hierarchy_2:OK
> 413     tailcalls:OK
> Summary: 1/1 PASSED, 0 SKIPPED, 0 FAILED
>
> ./test_progs --allow=3Dtailcalls/tailcall_bpf2bpf_hierarchy_3
> 413/24  tailcalls/tailcall_bpf2bpf_hierarchy_3:OK
> 413     tailcalls:OK
> Summary: 1/1 PASSED, 0 SKIPPED, 0 FAILED
>

Thanks for the fixes. Will review this series soon.
BTW, do you test other tailcall test cases ?

Cheers,
---
Hengqi

> Haoran Jiang (2):
>   LoongArch: BPF: Optimize the calculation method of jmp_offset in the
>     emit_bpf_tail_call function
>   LoongArch: BPF: Fix tailcall hierarchy
>
>  arch/loongarch/net/bpf_jit.c | 140 ++++++++++++++++++++---------------
>  1 file changed, 80 insertions(+), 60 deletions(-)
>
> --
> 2.43.0
>
