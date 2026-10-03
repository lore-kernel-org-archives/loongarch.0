Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC2919D07E
	for <loongarch@lists.linux.dev>; Sat,  3 Oct 2026 04:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791000119; cv=none; b=CbFvhYvMxvDL8KhYRamqlgxeUGapNdFqCwIXbltHFAwuQEIku8LpAuYs1InOkfFbr9LxCeGN3rpEyJrMuYm8I0uejeV3vTTTRwquvO/Oh86jY4ICPQIo0/yn279K8tKyC0EmC/TrOlVFznPm6l1L/hRWiAbACowZG+ZFBwGr3SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791000119; c=relaxed/simple;
	bh=Sb5UNxrfQ9/JoiNjxS03gT9zrF6Z+f52eGGmnS8uyHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=odWkUgZRpVIKFFAIunW6H0tlhRSm8HSG83KuSYhrItkDC9VS7pbgvvTgM+XF0IDy7f0a+zWoXl3VaBFpzP66Knh+aGRSwU22TXzA54nf87fbTvrSgXl8jBqEv9BClhbSGllzYOmjr+hsCls5uqQHlJ3Jmf6XEgmtdfsGMBANQ/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XI7kWh1G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XI7kWh1G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 280841F000FF
	for <loongarch@lists.linux.dev>; Sat,  3 Oct 2026 04:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791000118;
	bh=Pg6laVdxAB6RQze+P0V8gUYXNdnIX17PKTC+hxCYIIo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XI7kWh1Gwt7gjQ+h6sf/kaKDv0BzkpVrrceAoTEMVto1VBKc+PLm6btzmCDX0Mpfa
	 E1ISHU4iyKSHvVbCSzIhRGNpON8ev8tH4ZQymcY2jK5hElV5Yjv7J3cdbF65AyRvIk
	 puEmAq6ydAeRAqlI04DcduiaiVteq2hJUDOwMmkNe+Tr89ZXJzpPd+0jORfTU3/DPV
	 CqPrVdkdmkz8s+JnIjIlGmjJnNiu+eRQjqFXT3MnWpCkaX3oNvpjfIcjUinWPeMXGe
	 L+wg+/KBwmhewsT7QSEulF7QiurVzXCKLl9il3sSdL0TvMmEZQDbW4S7DZ9FEiYMKj
	 4dHCcSoCTUe0Q==
Received: by mail-ed2-f29.google.com with SMTP id 4fb4d7f45d1cf-6aa0ee64afdso192955a12.0
        for <loongarch@lists.linux.dev>; Fri, 02 Oct 2026 21:01:58 -0700 (PDT)
X-Gm-Message-State: AFq9FYLT7dsmu7/6KE8fxMevH28mUxoutY3u9B3+Lt4RQ9WBPXr1qpba
	GGZDkpOe1HZfx7K+d5/sxagXgP0llXjMHVN7Ha/uec2HWMOTHj1I07RfzSusmJkldnTpgaSvqJw
	P+dfHFg916+r19gSzMGSuE1056QIbg4c=
X-Received: by 2002:a05:6402:360a:b0:6a9:d0f0:69a0 with SMTP id
 4fb4d7f45d1cf-6af9e2c1a0bmr3332575a12.11.1791000116803; Fri, 02 Oct 2026
 21:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260924142708.2459-1-yangtiezhu@loongson.cn>
In-Reply-To: <20260924142708.2459-1-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 3 Oct 2026 12:01:44 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4y=q=c-v2W2NewL6pjjU6gMRtDyPZrGjOsBV_QyTNRzg@mail.gmail.com>
X-Gm-Features: AclHuK_JoOn5evCKxXIh6dDcYyY0tMXBU4gZNlB8m-rEDex9vUj0iKdJDKXo8-w
Message-ID: <CAAhV-H4y=q=c-v2W2NewL6pjjU6gMRtDyPZrGjOsBV_QyTNRzg@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] LoongArch: Fix perf hardware breakpoints
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.


Huacai

On Thu, Sep 24, 2026 at 10:27=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.c=
n> wrote:
>
> v4:
>   -- Do not modify thread_struct layout for hardware breakpoints
>
> This series addresses severe functional degradations in standard
> perf_event usage, including initialization failures and one-shot
> triggering limitations.
>
> Tiezhu Yang (6):
>   LoongArch: Fix bitmask corruption in update_bp_registers()
>   LoongArch: Remove redundant call in update_bp_registers()
>   LoongArch: Fix architectural naming typo for CSR_FWPS_SKIP
>   LoongArch: Only send SIGTRAP signal if necessary in do_watch()
>   LoongArch: Fix perf hardware breakpoint failure via installation
>   LoongArch: Fix one-shot limitation for perf hardware breakpoints
>
>  arch/loongarch/include/asm/hw_breakpoint.h |  8 +--
>  arch/loongarch/include/asm/loongarch.h     |  7 ++-
>  arch/loongarch/include/asm/processor.h     |  3 +
>  arch/loongarch/include/asm/switch_to.h     |  2 +-
>  arch/loongarch/kernel/hw_breakpoint.c      | 66 ++++++++++++++++++----
>  arch/loongarch/kernel/traps.c              | 12 ++--
>  6 files changed, 74 insertions(+), 24 deletions(-)
>
> --
> 2.42.0
>
>
