Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074B51DE3B7
	for <loongarch@lists.linux.dev>; Wed, 31 Dec 2025 02:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767147017; cv=none; b=RVb0s8fHqXMQMymg9zw3K1jMXZy68ZNH0RY3Z4f5onO2bdgOVpFvu28AN0O6do3c6UitzBKcVbfOcBHhxUTl/RZl4cV01M9wA7C4WTeJXC3BBuyQqDo7MA2w7cUux/jFUodgySg7ULvVLNmR05u3/2fqDK8MF6h2w9Di9MX69vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767147017; c=relaxed/simple;
	bh=9t8d+uEK5qKuVOPtQx8Wwxf1C5J3lMUNJCi31NbMIVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sDqFJcw/YHI0DmRQOd5qTUWRk6HiSep3uJY3tFNxHqe6iSC8AE+FvZp0dfEVoD5hQG1PewdQlkzX/0fm70N3JI0AyBE4SHBNYAdxYGN2jCM3antwPqoewyFUK3HmodI98ljJmoPnmTMD3oXtPiUXoRVyRviDTRTf2nUOrGK0CxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iAC7dPV3; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iAC7dPV3"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4f822b2df7aso37631101cf.2
        for <loongarch@lists.linux.dev>; Tue, 30 Dec 2025 18:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767147014; x=1767751814; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4MvaiI9hxCNyE1A95Gi5A/csp02KOa0xgsMR2iVIi8=;
        b=iAC7dPV3G6d/8hEheisiv1e1UkFjeAypY4JitT6Ayum0hHVWIN8FU5BBefQQ2HZ6rV
         LGForRz2GFAIFwrDO3xqpAsYGd9ZiRtczJ72HDZ5jbgYiqzX9HjMxM/1Lx+IXt6kLHNn
         oCGNlmNldeJn9mzrufw5mHG3PoLm0hijxcuj0Eo/U3oEArmI1gRBWL3rIrk+o0bddMsN
         x6hcpo9IYSHWaVHUwGyLo8VDs9ZQ4d9FsAbExLKrI87sqM3OIXYyUiBZkl28/7vsxPvv
         6gc99Wlzz+PaYUl9SsJjqCsDfmxjnRDeGiRFwGE8KJm21gvvrRjEqZXl+moE7zTu9sw2
         rk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767147014; x=1767751814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W4MvaiI9hxCNyE1A95Gi5A/csp02KOa0xgsMR2iVIi8=;
        b=dhhrz8J5H4SUeRKcPucHwjxCN5Wu+LezTpWVdlWBzwBIZG/A5/+o8VgxCh9wQ3nnKY
         MKh96VGCIzwX/A9aZobJdqAyq6IB+lY3/QEPTqqxnSYXUrtKvtZca3aZlmuSqkiM8quL
         5N9cf8tnknEI1nSO2hKfJ5OuuUt6k6rLlp+tJbGhFEUgRVttWokTrCHkRc4Sz9+gyLSo
         DeWeJz89Q1BfzvcBxKpob/BQzXnWfi1DtSnNEVfk0nf7Jzm1PNKoIhgY1sx/KqUrpEZj
         iB7JAPpRp6hGxsmtM3P7iVamSGRm69M7SW54grB6KwYaO0Y8uTpRQQ3JHI5qSe5FQNvQ
         t7Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUEqsB0uWlGCkk7PMK0X2DSZ7Rb7glGHCTlrayDpVx60tOLZ0blauxKyl9S1sG4gYdxS1O4dtiA+68=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywc62YcZBGGkyk1LMHD/IB9d9gpOy7MXiM725fki3xyrd+3kGOP
	XW/j9EngZha2UH4fXXO+fhZSePAEEAxgPEuUIa+kksW2SLQi+0z/VpcUH1mbyhdkkpkU1pM+12h
	eY0og7ZnEzisOPiSKRVOO66Wy0I3RAvE=
X-Gm-Gg: AY/fxX6Z3r+53GUqA1rWb55UBMVNxIqhIdesv8eEJMkQ9rf5tQ0JriZqXMPxKrhWIvd
	BHP+6OpazRILIAbHeVuE/mKrJJ2oZdUFijwF9QKTfMHrWBQzt7usZuSk7AuhkPuTmo6NCZBdekb
	5wCRTPOrsuNlb7lPfFjWQJFJkcFYlQTIbwRAz4So+/KLzPYryln12R5mcUrqQ6UhqLWOOiInzkk
	ZjqwYG7IPARKhL+WHurq6HhwhbzF9kRyumtNsPnDs+O9KopXleSLM6JCYbk5eS7CLAZPu7SVuMy
	RXq0/w==
X-Google-Smtp-Source: AGHT+IHUbn9AozfMhVHdAGN+byeNxERi+9+DSCikX0mqkcQm/uxSsIXb920JXaLAozUe7VGVQpxbZeCZhD728AWYZbM=
X-Received: by 2002:a05:622a:6bc6:b0:4ee:bbb:ba73 with SMTP id
 d75a77b69052e-4f4b45ddc33mr338059771cf.42.1767147013892; Tue, 30 Dec 2025
 18:10:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2xa4imA5hmQnrnfXt3ek1Rag89sL8mO9aGYjZWtZ3ckfw@mail.gmail.com>
 <CAK3+h2zJk7V-VNA9cG4C1BX02Dphyt_XXN8i_ERLAQbmJn++JQ@mail.gmail.com>
 <CAK3+h2x2o7xh-=bB5yPKieZWd6BYmke6QNvB5iG7fM9sqPjE=g@mail.gmail.com> <f5954f91-969d-8bf0-7f03-be4dff5d839a@loongson.cn>
In-Reply-To: <f5954f91-969d-8bf0-7f03-be4dff5d839a@loongson.cn>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Tue, 30 Dec 2025 18:10:03 -0800
X-Gm-Features: AQt7F2rw53AgGNt_rkajMTA3hhi25qg3F3Y6ITcVCZXVDdCCDc10SLtn7WKgOqU
Message-ID: <CAK3+h2yjK4BRBAEnpzSnKao0ms03mVnnHGvE9CTS1A2ha-MmSA@mail.gmail.com>
Subject: Re: x86 bpf selftests report for reference
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Hengqi Chen <hengqi.chen@gmail.com>, 
	Chenghao Duan <duanchenghao@kylinos.cn>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 5:36=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2025/12/31 =E4=B8=8A=E5=8D=888:48, Vincent Li wrote:
> > On Tue, Dec 30, 2025 at 2:20=E2=80=AFPM Vincent Li <vincent.mc.li@gmail=
.com> wrote:
> >>
> >> On Mon, Dec 29, 2025 at 1:27=E2=80=AFPM Vincent Li <vincent.mc.li@gmai=
l.com> wrote:
> >>>
> >>> Hi Huacai,
> >>>
> >>> I did a manual full bpf selftests on x86 machine, no ns_bpf_qdisc
> >>> failure, so indeed like you said, it seems loongarch bpf is
> >>> deteriorating. Here is x86 failed bpf test report for reference, ther=
e
> >>> is no hang up or anything like that during the test.
> >>>
> >> After testing 6.16, 6.17, 6.18-rc1, I am not sure about the loongarch
> >> bpf deteriorating any more :)
> >>
> >> Test results:
> >> 6.16 ns_bpf_qdisc not supported
> >> 6.17 some patches enabled ns_bpf_qdisc support, but ns_bpf_qdisc panic
> >
> > if I guess it right, I think commit 6abf17d6 (LoongArch: BPF: Add
> > struct ops support for trampoline) seems to have enabled ns_bpf_qdisc
> > support.
> >
> >> 6.18-rc1 ns_bpf_qdisc panic fix commit merged (8b51b11), ns_bpf_qdisc
> >> mq test failed with WATCHDOG messaging on the screen.
>
> In short, what is the problem on LoongArch?
> Did you mean the following test failed or paniced or something else?
>
> sudo ./test_progs -t ns_bpf_qdisc
>

I don't blame you for lack of context :)  There is  offline discussion
about Huacai merging module_attach fix patches and some of Hengqi's
patches  in 6.19-rc3 and worry about there might be regression with
ns_bpf_qdisc. ns_bpf_qdisc mq test shows WATCHDOG timing out. my
report here is to show that no regression from Hengqi's panic fix (
8b51b11) for ns_bpf_qdisc

> IIRC, there is a patch to fix the problem:
> LoongArch: BPF: Sign-extend struct ops return values properly
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D8b51b11b3d81
>
> Is there something wrong with the 6.19-rc3 or the coming 6.19-rc4?
> If yes, please report it. You can set CONFIG_RCU_CPU_STALL_TIMEOUT=3D60
> like the other archs.
>
it is not a matter of setting the above timeout from what I observed
so far. what I noticed is that for some bpf selftests related to
network including ns_bpf_qdisc and xdp_synproxy, they both reported
WATCHDOG message, what they share in common is they both trigger
tc_bpf program to be loaded and some libbpf patching about tc_bpf
program, then WATCHDOG happens. This tc_bpf program load does not
happen to x86 for the same test. xdp_synproxy has XDP and TC test, if
I comment out TC test from the  source code below, xdp_synproxy XDP
passed, no WATCHDOG of course.

void test_xdp_synproxy(void)
{
        if (test__start_subtest("xdp"))
                test_synproxy(true);
   #     if (test__start_subtest("tc"))
    #            test_synproxy(false);
}

I might ask on the bpf list on why no tc_bpf is involved in x86, maybe
kernel config difference or something else.



> Thanks,
> Tiezhu
>
