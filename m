Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A46F328623
	for <loongarch@lists.linux.dev>; Wed, 14 Jan 2026 04:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768366670; cv=none; b=jgUOZ2cVWkcvWUYMp9PnyHiSVlklYzUP+JSaik+dKon07FvmHQsTzqGfzyuU4L+7C5FeGdZh1BWwKlRsnD1no6wyD2KQwLcFBVuJrSojgjKNcfC28u9lXywLk7eFCX81Q/5z5VrAjpcECqrNzBlcLCtgTSkSNE42ZFb3KmI9Tm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768366670; c=relaxed/simple;
	bh=P1chFjRE6UnKk6GS3VNML76Z4fLeU2slg54cwDDCaPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RSkyfYSj7m/MpyhSZHAPIamY7tgSbvYOf+fxbcpeahpAb3mGLRwN6ua8tKMnk32y3rvJheaUhos/Vq167nsYWDa6+6G5sTCCG7jJVE7xx3QARXGHubcZFox2oXLCNCzhX/+1brN9cDEDNYidUkfOwswE0y0PH7XZkcaYKXEI8CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVRDDlL8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVRDDlL8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEBC1C19423
	for <loongarch@lists.linux.dev>; Wed, 14 Jan 2026 04:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768366669;
	bh=P1chFjRE6UnKk6GS3VNML76Z4fLeU2slg54cwDDCaPI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iVRDDlL8Pf1939R6s5BYx8dynlyhW2/wEKJPJ/5Bg7GCiSd0JZTEO8ckQJ4dvC85W
	 44BIjxYrRgMfGUHxc9+S3UuunecSZdvbqFocX9BH4DNOD75Ce0wHchoPYxOZGQ63HN
	 ux3N6nZ8bYl1e/PaFTbjJ0IE0qOc9EiwCd1wgMfbYiqtzoa8Q3JXsgyzdFgmxo8RfX
	 ymCn/ksHt4OflufndSOIKWeGbamsvqUdWSTs2dnu6nx0dsqeqBg9dqeMJaRFAxMwQk
	 SvKDGn3tR41vaaLoNo07ZzBu5Ly2Yh90M+yNK0etgQbVvyqGWeJe+GKBcSIvOxVodE
	 15F5EqyAXjizw==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64d4d8b3ad7so13298608a12.2
        for <loongarch@lists.linux.dev>; Tue, 13 Jan 2026 20:57:49 -0800 (PST)
X-Gm-Message-State: AOJu0Yxcz13QDz/68xOCZeNUVfEGda90siHQRmt9azxs4mmQpQKrTBgt
	gAho+L/lBIqX7wnBhDj5C9wxun9lV697p6fmrdaWisDIM58FEz5Sfq4JAEwNqytzC+98vJx55AE
	52KA22X/J7ZjKeSAscXhXK2WDE41PmC4=
X-Received: by 2002:a17:907:868d:b0:b87:1ad0:d419 with SMTP id
 a640c23a62f3a-b8761023edemr109404366b.22.1768366668341; Tue, 13 Jan 2026
 20:57:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260112091531.12735-1-yangtiezhu@loongson.cn>
 <CAAhV-H6xLX5ZjVKV9bixN=PT6p47JheDU4pYtqeo-=2BSnQkRg@mail.gmail.com> <b1c56000-8669-04e6-0468-a5ff1fd611ac@loongson.cn>
In-Reply-To: <b1c56000-8669-04e6-0468-a5ff1fd611ac@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 14 Jan 2026 12:57:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4eV7CQ07rKZV+pCh9xikWrDztBATMYpVEb43Z3sVg_CQ@mail.gmail.com>
X-Gm-Features: AZwV_Qjs8_c8Ws3RY1Q_arYawOQsyaITqrRQZORLrqVsaIeslZXaE_8KE8qhYdE
Message-ID: <CAAhV-H4eV7CQ07rKZV+pCh9xikWrDztBATMYpVEb43Z3sVg_CQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "LoongArch: Remove unnecessary checks for ORC unwinder"
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 9:17=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2026/1/12 =E4=B8=8B=E5=8D=885:23, Huacai Chen wrote:
> > Hi, Tiezhu,
> >
> > On Mon, Jan 12, 2026 at 5:15=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongso=
n.cn> wrote:
> >>
> >> This reverts commit 4cd641a79e69270a062777f64a0dd330abb9044a.
> >>
> >> The system can not boot normally with the latest kernel 6.19-rc5 under
> >> different configs, commit 4cd641a79e69 ("LoongArch: Remove unnecessary
> >> checks for ORC unwinder") is the first bad commit since 6.19-rc4, just
> >> revert it first before finding the root cause.
> > Can you show the errors in the boot log?
>
> Please see the coming v2 patch, there are more info in the commit
> message.
I also see "cannot find unwind pc at" when I debug KASAN, but since
KASAN is not enabled by default, we don't need to revert it.

And I have dumped one of the call traces of this message, hope it is
helpful for you.

[<9000000004ec3c9c>] show_stack+0x5c/0x190
[<9000000006c1889c>] dump_stack_lvl+0x6c/0x9c
[<9000000004ed6d08>] unwind_next_frame+0x998/0x9c0
[<9000000004ed1fd4>] arch_stack_walk+0xd4/0x1b0
[<90000000050313e4>] stack_trace_save+0x54/0x90
[<90000000052bd880>] kasan_save_stack+0x30/0x60
[<90000000052c0368>] __kasan_record_aux_stack+0x108/0x130
[<9000000004f521c0>] task_work_add+0x100/0x300
[<9000000004f77c58>] sched_tick+0x138/0x440
[<9000000005036460>] update_process_times+0xf0/0x160
[<900000000504fb38>] tick_nohz_handler+0xf8/0x260
[<900000000503731c>] __hrtimer_run_queues+0x20c/0x330
[<9000000005038bb0>] hrtimer_interrupt+0x1a0/0x3f0
[<9000000004ec86ec>] constant_timer_interrupt+0x5c/0x80
[<9000000004fe9dcc>] __handle_irq_event_percpu+0x6c/0x190
[<9000000004fe9f04>] handle_irq_event_percpu+0x14/0xa0
[<9000000004ff3eec>] handle_percpu_irq+0x8c/0xe0
[<9000000004fe8eb0>] generic_handle_domain_irq+0x50/0xc0
[<9000000005caf8b4>] handle_cpu_irq+0x54/0x90
[<9000000006c18d88>] handle_loongarch_irq+0x28/0x40
[<9000000006c18e64>] do_vint+0xc4/0xf0

Huacai

>
> Thanks,
> Tiezhu
>
>
