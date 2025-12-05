Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDF1313E2D
	for <loongarch@lists.linux.dev>; Fri,  5 Dec 2025 07:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764918294; cv=none; b=oZ/f0PWoo4SWXaH7zaVuYWHVLk9XOCcgmn1wEb7mihjLNGSmQdsy2oI4326zAwiUQC9EMHnZXcFjlgBZXwva0FDHM2I7JossO0/x/DBR0WkmvqPO36vgVQKBPHtmTCfub5hlbqWVSJTDIntj+Oubo0v4WkoaKRwBsMN0Rj0ql/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764918294; c=relaxed/simple;
	bh=+OrB9AE0d5cBLLPBjUViui646HkkECciNTC6kUMmb/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KjABwlovLr7UzTyKNb/6qNrSCMWYdhFtFNIhvDmOujV9VtLCgb5i+3i+cUaIZ6FSUz3Gd8MPyXkvVS2iuY7nrtG3X81lH/D7wdrPnWJuT6rfNBe9609A3ck8tQ8VQZMjKGjOQtTv7NDzJqatLB3u0hrN0/nWaaVCCK1QlsMfkxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5zsZiDB; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5zsZiDB"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-3f50614f4ccso732812fac.3
        for <loongarch@lists.linux.dev>; Thu, 04 Dec 2025 23:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764918284; x=1765523084; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OrB9AE0d5cBLLPBjUViui646HkkECciNTC6kUMmb/U=;
        b=b5zsZiDBdrJvuJNogVQptGkFtXGxaLKksmAHDIPS72/TDP7KzSXtwDEWaQgYgNypgv
         ypubaQ8uIunYJhOwZlUPgpHCvONlBtKX3Q+3pKuHa2zkvkohIB8UqMAwZ4zVwgGt6s0t
         wmqez+3WH46DwWXGBdXVM8s/qj7gOYWslHFW42djVEUw4IIcNzlhfCWsBCBu/KEUSXTN
         Clm5MCtUFXbP9Enbdd1PEbX0SaZ/WeS7rC9Sqf5gp5q83texWQmNR0rUhmz1pGPw8ORd
         hLjW9urZyvat18OPhG8wDHPtj47yI7ZXaZA8/Mqr7zDcMEF6860Z5ScyGZcurVYxvSho
         8mMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764918284; x=1765523084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+OrB9AE0d5cBLLPBjUViui646HkkECciNTC6kUMmb/U=;
        b=lIwo8eBObzL3oqCpQb8vePgkNe77VGPUbKacN3z/bTJwUo+rNrfQFH/lGWWYxcH8/C
         3YHbHYRnH0mTKR+s5H0PMXPKMTrDxYSvV3LSu3zTzxq/hx9bt6uCCjgu8ZXqHz0Ip448
         OvAj75HNONtJQO/LjYBLbCzaRZuAX13UPFjiWkM2Ot4Pqw/hm+GaYnC9w5WNys/K7LNY
         PJzihKK2kD6h9Z6xngN6xyBhTbih6DWSVVt2xpJiqDpB0P/FBCbnt9qXgL2yCRz1rVCx
         cfTEM3xD1mx8osFO9v7kXFLkGuv5mABBmUAi1XZNkv40f60STl02rnwB4Pk5R58nDeJ1
         VQUg==
X-Forwarded-Encrypted: i=1; AJvYcCXru8GGMs9ovc2Dr/MrzNoqfvApJI/F9AjI8jM35WqSSYj8lESASi4ukaNUuCk5s9HbyU1/jZeEkUE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzeEHYmR6vsFrS46Fvun3QoYFLXdg2qdAxvdsVy+ntswy8g6d8M
	fWn/yFoWpbPZoewZK+oFq12jb5w0r9LYcZ+yk9JUn1YieyiAff3fKSHwht8w2tGEefUytElZixK
	fj3R9BxGyVUxaHUzzObUWbR3OV3TL25uB+Vfo
X-Gm-Gg: ASbGncuvkLNgrQRDy3rYzWHOwQ31IqnGBMf1WY35GucuAH46K0CgtzF1tqlqFxw6pc/
	6KrZcYpG3kWsbCzJA4lQkLfarMy1EF5uKJpGQVXUdPDll+nsejH3mx5XZq9WYe58v9eKqjQkg/0
	f7ea+9f5rfCCRc0ba7IBZB7aVl0Gq7B9j9G0cJCk/4AEQ5Wc4KwJsvnmh0oRljmQGJHrm+O2zqA
	isXBe5pvDooG8ARQPvtrS5FA6jEO2cX/RCs/rWi376FIuKQAB4CAst3YBx0F2rjac4/cFE=
X-Google-Smtp-Source: AGHT+IGUGG/hLNyZIKDCu/RPV2YtAQNJt6SIPDXE5WIr7W8hGOufrDBoWHHdESV4dnRdEwn9qH4ykZZ+89Xay4FVjzQ=
X-Received: by 2002:a05:6808:11cf:b0:44d:a69b:d236 with SMTP id
 5614622812f47-4536e51ccb0mr4026817b6e.36.1764918283630; Thu, 04 Dec 2025
 23:04:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251124055642.1591-1-hengqi.chen@gmail.com> <CAAhV-H6rrpgBF+bMpEvsJyq0F7sdWisGSwTbuf=ZBhi4XD-5jw@mail.gmail.com>
 <CAEyhmHSntgSQdAOksd6YUsHh0UXJS7XMmSHAZmRDQ5uEzDU0JQ@mail.gmail.com>
 <CAAhV-H5Vab3bwgT2LdGyNB4ipzhnS+JW7PdcOSmNm4JZ30tWTg@mail.gmail.com>
 <fc62bac6-b212-3aed-1536-aee8a60d2f0a@loongson.cn> <CAEyhmHQO9bDP7L=cwxLUbQCrkFfcDaSeKMgB5R32sqMgvJk7ng@mail.gmail.com>
In-Reply-To: <CAEyhmHQO9bDP7L=cwxLUbQCrkFfcDaSeKMgB5R32sqMgvJk7ng@mail.gmail.com>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Fri, 5 Dec 2025 15:04:32 +0800
X-Gm-Features: AQt7F2p5TKB4u6xSxAgLsJUzfvgLf06Bd7NLnNN9jo7WjdL0sLXJ7mxiJU_MAKU
Message-ID: <CAEyhmHTUToX3qedYVS7v3LP84f3LiW9NbrH-nzxEqEdWAkhFmw@mail.gmail.com>
Subject: Re: [PATCH 0/5] LoongArch: BPF features and fixes
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, vincent.mc.li@gmail.com, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Huacai,

Will you pick this series for 6.19 ?

Thanks.

On Fri, Nov 28, 2025 at 9:37=E2=80=AFAM Hengqi Chen <hengqi.chen@gmail.com>=
 wrote:
>
> On Thu, Nov 27, 2025 at 3:30=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.=
cn> wrote:
> >
> > On 2025/11/27 =E4=B8=8B=E5=8D=882:44, Huacai Chen wrote:
> > > Hi, Tiezhu,
> > >
> > > On Mon, Nov 24, 2025 at 3:49=E2=80=AFPM Hengqi Chen <hengqi.chen@gmai=
l.com> wrote:
> > >>
> > >> On Mon, Nov 24, 2025 at 2:31=E2=80=AFPM Huacai Chen <chenhuacai@kern=
el.org> wrote:
> > >>>
> > >>> Hi, Hengqi,
> > >>>
> > >>> I think this is the successor of
> > >>> https://lore.kernel.org/loongarch/20251006053323.193581-1-hengqi.ch=
en@gmail.com/T/#t
> > >>>
> > >>> Right?
> > >>>
> > >>
> > >> Right, sorry for the long delay.
> > > Could you please help to review this series?
> >
> > I trust Hengqi and I am OK with this series in general with
> > a quick look.
> >
> > For the two functions sign_extend() and emit_abi_ext(), I
> > have no strong opinion, I do not want to respin the patch
> > since the merge window is coming soon, it does not affect
> > the correctness, so we can refine the code later if there
> > is a better way.
> >
> > Acked-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> >
>
> Thanks.
>
> > Thanks,
> > Tiezhu
> >
