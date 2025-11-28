Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932031C861D
	for <loongarch@lists.linux.dev>; Fri, 28 Nov 2025 01:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764293837; cv=none; b=LQcUs23BwwKQSMqOx2FanV6q+3OJjJoY5uLlIKfSv1fvTavB+yaN3LkuTpetT4rdtQzOd+VnF8v+ffh2/qBL3GCm0g2FqqrkWZe6jwzJFpj7GQMXcmrFWoKPwWDI8CvghN5O6eSdmlnBY2+Gc+1QbFAw81vWRx2TjinrB1vM+0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764293837; c=relaxed/simple;
	bh=mwRgOt0HEgmVyku3QkUnaQZagluBYD4xcKYXPXozwRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nsUXmgDGhoG2OFItbXUjiCd46zKcqER5fjBniG63VU9y5xiB39Z5L3rhnHpnfOrLoNqAiFBfG7lOUWutlcOxwnlYimMq9w7Gl/3S3QC3Fq0ASxVoaBZtcWaCkh9fxat+LJcVdpHaerZ4gzT3jew2aGWYnozIPtONr5SS5dTySM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TB2iAOb7; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TB2iAOb7"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-45034dbaaabso582081b6e.3
        for <loongarch@lists.linux.dev>; Thu, 27 Nov 2025 17:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764293834; x=1764898634; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwRgOt0HEgmVyku3QkUnaQZagluBYD4xcKYXPXozwRY=;
        b=TB2iAOb7QvkzZurfcqD4TZ3c9vgKmX6YCyJwod/fuq/KO4Anpq4mCLVAViXWJdQg5A
         mJGgqXJS0B+GI4iRjQcMPC1ab1RcXHAVgXXXx+cl5H7MsnCunwfHPchIvIWwzqZDjpdI
         nWoRICtH5ex2b6/9elOYYxBitDBPxnUqGWXGxxTGGze+PVKJ8g2gBF6KpJIQy4e3veDB
         5SbWeUde7Mtx76M7InTN0EVipki4jwZpzWpdrFIf2JDNQrqekMxdcO5XiwJdnJiFyzLs
         Dlod49JOJ9rnsIG2z3BgZaoROXxFp4ikj8hSRl4KdjKgL17utYRGxvWCfsFwZjfHC1ld
         jPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764293834; x=1764898634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mwRgOt0HEgmVyku3QkUnaQZagluBYD4xcKYXPXozwRY=;
        b=jiHcvLcHouOCxLLd/jGnWOOQAMqAC+fQkfkL7QA4zqpx6mLJsd76cyaEGRbPuVOLP+
         edGwu70+SvQ5uvN/rj3Mj2sPIzWiH4+GOYDRlRHtLf3/v/1lv5Mifjzz8FY1Dxiz4HMK
         P1YNFQpHlX62jMwo5CJA1txU0Wu/a9Ks1nSbtiYNy4X0ZT3o1QrSKoKBVr6biUjhrn3q
         41Nfh7WNlZ59/3FRrNM3BsLRYZQEDbANFlspYO7NYjTeWFx6TszbWB7Yddd76a6AZZ7d
         1n6KKkDSvc1ihX1v5bNMIynac46pXPmJLW9pQ5K/1DYDw5A2YVIqk5Pzfq8q99rAvWqR
         91NA==
X-Forwarded-Encrypted: i=1; AJvYcCUPWUeSd+a0l1YYYV086ZQLTKmATMKa/VFXAslH6TdEyK2b2NVgSqF4B7G+6yrxu2y+yb1xx82207E=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNZkOK5syvSr6s9nYcZpQScZpZ3ewedAh/u8XkU6R48eXj5EPC
	owHgey1+RQC/kFgjhiHAi0rp+JQg8evcnWBxAL8FcN5BJF29tJgK1fgLZg9ziElljrzQNO7QYIt
	wthRnVm2eJqQ7xtBwvxoRBgd2G4bbP6w=
X-Gm-Gg: ASbGncsIo/3/5YHAncNA1bMDJ8epTpZVrWHDKCW1kOhdIKHWN4WOR5hHJtPUskJCN/J
	OqVSmwT7NNeTclDKVMuiWtTdM9EDRBBSPLVOuV67fAL+Cocx2tuXXeE52DoIdSTnJBofAG8WeUt
	9WX/5rk9Vu17utReHvUOLQpbXLcDSunkxSScxPgQ1y0To63YKzBt3MvggTRR6M9RxKUI6WRDXZa
	WgciMO1GodXjTntiIB9KwQtFVFYEFYWbjxgdLc1UwJCQB/5/jS38VKfoHBbWsBs/ZZs/g==
X-Google-Smtp-Source: AGHT+IHjYkTuajCBLuGR6nAPY3Gpfe94vFmUcGALoOGUlehNXLYb1U3R8RXkkktrZrHkyrtKCCXuAZE/JrMoPI1H7vY=
X-Received: by 2002:a05:6808:4fc8:b0:44d:be6b:33c1 with SMTP id
 5614622812f47-45112d59147mr11774250b6e.65.1764293834649; Thu, 27 Nov 2025
 17:37:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124055642.1591-1-hengqi.chen@gmail.com> <CAAhV-H6rrpgBF+bMpEvsJyq0F7sdWisGSwTbuf=ZBhi4XD-5jw@mail.gmail.com>
 <CAEyhmHSntgSQdAOksd6YUsHh0UXJS7XMmSHAZmRDQ5uEzDU0JQ@mail.gmail.com>
 <CAAhV-H5Vab3bwgT2LdGyNB4ipzhnS+JW7PdcOSmNm4JZ30tWTg@mail.gmail.com> <fc62bac6-b212-3aed-1536-aee8a60d2f0a@loongson.cn>
In-Reply-To: <fc62bac6-b212-3aed-1536-aee8a60d2f0a@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Fri, 28 Nov 2025 09:37:03 +0800
X-Gm-Features: AWmQ_bnYhg8U5s9Ie9MzM9iVMJv-K6ZIJYZtfkIqO4azgXZ5Ga-4nLNUjW93aqI
Message-ID: <CAEyhmHQO9bDP7L=cwxLUbQCrkFfcDaSeKMgB5R32sqMgvJk7ng@mail.gmail.com>
Subject: Re: [PATCH 0/5] LoongArch: BPF features and fixes
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, vincent.mc.li@gmail.com, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 3:30=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> On 2025/11/27 =E4=B8=8B=E5=8D=882:44, Huacai Chen wrote:
> > Hi, Tiezhu,
> >
> > On Mon, Nov 24, 2025 at 3:49=E2=80=AFPM Hengqi Chen <hengqi.chen@gmail.=
com> wrote:
> >>
> >> On Mon, Nov 24, 2025 at 2:31=E2=80=AFPM Huacai Chen <chenhuacai@kernel=
.org> wrote:
> >>>
> >>> Hi, Hengqi,
> >>>
> >>> I think this is the successor of
> >>> https://lore.kernel.org/loongarch/20251006053323.193581-1-hengqi.chen=
@gmail.com/T/#t
> >>>
> >>> Right?
> >>>
> >>
> >> Right, sorry for the long delay.
> > Could you please help to review this series?
>
> I trust Hengqi and I am OK with this series in general with
> a quick look.
>
> For the two functions sign_extend() and emit_abi_ext(), I
> have no strong opinion, I do not want to respin the patch
> since the merge window is coming soon, it does not affect
> the correctness, so we can refine the code later if there
> is a better way.
>
> Acked-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>

Thanks.

> Thanks,
> Tiezhu
>
