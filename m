Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E31481B1
	for <loongarch@lists.linux.dev>; Mon, 11 Mar 2024 16:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710172951; cv=none; b=L3uM43n80EnRVPldcewpOhIRu1vYIRE4oF8utosDTg8YChifaFXuRQdloLgkkMeaXbBueNZ4lUs2YbXpq76TaVvykweK2kYAee/xnpppXEdP10mtcjd/+aphw83rUYaG19TqQ87KYDiwF0g9gxp3n9H33gAzgd2PPeVv46z9EKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710172951; c=relaxed/simple;
	bh=WqZwvepuRPNX/qc+RN/1Vh/xaT+NTkTKJ1/VLmjuf04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=at+jHiOfvw7LRKMgFs/7IfgB1U/aYrdvJNSvoks0PqRF8ID+ad6puPSMIl9f5z09AsM+NvZPaD8c6sLyxdSiWsJGqvoi46XslRZj5AiKQux5sJRyY+v+SUIme3M7wPpjpVDEdtRLYukJ1nLrj7a3ALaM2q8dNBzD7FIygHCYVe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tg1gVE+5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tg1gVE+5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2AF6C433C7
	for <loongarch@lists.linux.dev>; Mon, 11 Mar 2024 16:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710172950;
	bh=WqZwvepuRPNX/qc+RN/1Vh/xaT+NTkTKJ1/VLmjuf04=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Tg1gVE+50H5CoCCVWtHWmRr6+IonJw8cHq/0ykgj9GmHsGl4s0ZmABJ4x7fywFs6N
	 BeOTlJ76XROQ1e1VlURbrJAh87+TuPvWxaShstv9jOFAJCj1p4wtaVRSDMa6uI9lNT
	 f4pply1jjLcl3H9PDHsfm862dTcEHc8WRMBAhsl3Q6NgZbWOjXYpedTNajDmarhSza
	 KXVsoqR3NIQVMGVV0Mgv9oSbk1CoArM6i0/HjePej24HJGT4c1klgQsPVKZRTyoA2w
	 f3Xclbv22XHWIdscK39Vo4/SzeRF9NNzNpgm+O+amjw59i86GmneJSL3oqCz5/QOYU
	 GYuw3sXHpwsjg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d33986dbc0so50036451fa.2
        for <loongarch@lists.linux.dev>; Mon, 11 Mar 2024 09:02:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6JnIwV+hjfJAdNQQoJRQFzGLQ3TujRr5/gPVCb3yspyUQhNUjfJt1itgXkrjOK9dGGNvyTHVIUaVTYQAAQw7v7zlWtRwoVbNj
X-Gm-Message-State: AOJu0YwtbA2359R3oqdATJcyU9wzjOD8T0dKGvcRW4/0byzxpEU4k3F2
	OCP4yGSxKL+/TuVgS8ZBPMIl5HPnBzFCUOlnQTZcC+Y0OMV3D/tE5U2IfLhefftQ1KENoAxPILp
	ZQgzLIk5CvpZweJ0ULNFONGfE6w==
X-Google-Smtp-Source: AGHT+IEb6SEAMF3zzezPotYKfNIak/i3S4Vzoji45ZROrvd7L+SgsEjFTdt4YntJt/Wfe159sB9omSGuSQq5QbBk2rw=
X-Received: by 2002:a2e:3c03:0:b0:2d4:d78:b05a with SMTP id
 j3-20020a2e3c03000000b002d40d78b05amr4021021lja.19.1710172949142; Mon, 11 Mar
 2024 09:02:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1707524971-146908-1-git-send-email-quic_obabatun@quicinc.com> <1707524971-146908-4-git-send-email-quic_obabatun@quicinc.com>
In-Reply-To: <1707524971-146908-4-git-send-email-quic_obabatun@quicinc.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 11 Mar 2024 10:02:16 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+LUVZF40vrf-3p77DLk5XLOgA0RF9duUHUthyUk5r7OQ@mail.gmail.com>
Message-ID: <CAL_Jsq+LUVZF40vrf-3p77DLk5XLOgA0RF9duUHUthyUk5r7OQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] sh: Call paging_init() earlier in the init sequence
To: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
Cc: chenhuacai@kernel.org, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	frowand.list@gmail.com, linux-openrisc@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 9, 2024 at 5:29=E2=80=AFPM Oreoluwa Babatunde
<quic_obabatun@quicinc.com> wrote:
>
> The unflatten_device_tree() function contains a call to
> memblock_alloc(). This is a problem because this allocation is done
> before any of the reserved memory is set aside in paging_init().
> This means that there is a possibility for memblock to allocate from
> any of the memory regions that are supposed to be set aside as reserved.
>
> Hence, move the call to paging_init() to be earlier in the init
> sequence so that the reserved memory regions are set aside before any
> allocations are done using memblock.
>
> Signed-off-by: Oreoluwa Babatunde <quic_obabatun@quicinc.com>
> ---
>  arch/sh/kernel/setup.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
