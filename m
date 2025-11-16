Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38EB1E1A17
	for <loongarch@lists.linux.dev>; Sun, 16 Nov 2025 04:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763265692; cv=none; b=JvYhha06nTRlRRkA3K57m+jDqSGU2gGx/UhWu2QVXuMKU8kd8IE+a2wK4jNB3/XcZV03HlhaOXzP2nvXyolW5m/DTRW1p+NLaHqFEoAXNZNh6VuQU/U/T8hd4yAcSX9AH0ioIfJC7M5CwKKjpWwTa/ve9xbXN/C121g9Tp9YmSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763265692; c=relaxed/simple;
	bh=ViKmEBt094e+TEyrkD/7l7Omxa8P2Y/BZpUwUU1mz/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HMGIfn5FP+uZ0RLHHqFPu0nAN6WESGYYwgnehc8uAEfEqS+JilcutZKeaIKHWCI3itiO5jjhr7p9tFSgCko0RWlqdtUuERbRuQAAgEEWjC9poN5/tQtKNSusqsFO4sqU0UhLpyr1kj3hInw3O5gxT7gs3mQSzvZ6mbKlsXnzyXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEDMLTRi; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEDMLTRi"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5959187c5a9so40833e87.1
        for <loongarch@lists.linux.dev>; Sat, 15 Nov 2025 20:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763265689; x=1763870489; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHOnnfu2WV/v2N1dBqAfZarNGYxVE6UYUn92Rk5owLE=;
        b=SEDMLTRiUsOOQUW9oipCzpZKVCk8Qy+QkDka8UK+djZCqS56XK7ebKr5p7jJp+v5g5
         OOs8c7js9zva5uS4WYDDAOZHGO03dxShfKH1YUHzJgsVcfp1ROvQpSROxoK8sxOki4CF
         HvIXDsyabRYflRp9hUpu3Vo5et+iGQ0K0pYUKy+FsOqD8BwJU/fMOv4gGnlBpyzylfO5
         dJYe0Dxn7nkeURUAEViJZpEUQ74PzMMoJRLdyqdY7L5BTcZ23NahxiFkayaXro//VYJZ
         onFrI8XnBwHxq2ccRteWRNtFd/bfMwQMIwsYSsIvPSUXEZ5QSiFG0lc88eX8aGVdKTGJ
         Hs3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763265689; x=1763870489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vHOnnfu2WV/v2N1dBqAfZarNGYxVE6UYUn92Rk5owLE=;
        b=gSdh2Gl4vh4q/LI7GE/J4IrYGXgZ8jSdez9xCR1fgJMd8L0HLgUQwx4KLSx//hAUWl
         0diOvC/VKeTQP8SrxXo8jdFnWD7z3Cb59Xn3WimaVUxLWk1AqlNbtrU+1FOz9rXuCtUU
         cQSnPmGGYS6u/7whDN0id8hkz9r+ZHFs4mwBxp1n9caaeNsgOjh30zFh0GU1aRuspBkk
         u9pCP61g4IRKgEn9BRLzAT0+HBcZyLmZAo7ZyzylBi+5zclgVSh6KZTPm3cbssH8HxJy
         8uDognC+Cj2lKIUU+47ziEhnSU1XJYdElDkfeQBpDtTnI+b/3XPtkrgMiyYN6KKpbvbQ
         6gCg==
X-Forwarded-Encrypted: i=1; AJvYcCVjjscOTQJFaMJ2aEV/7OWicwH+9HRrcXp9G0BbjKGe6msRtbXbxZPLxcmhKOZUFQIIy3k9746092k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9UfgjL9MuvmBdS+8RaHLqClZ7YhZ0r0s4ExmI9qHGdX/ZEG/C
	Y/BuExFSeN5M0w3pYEoTj9N/AWsro8cLSAvNPBYXOgJvSdJlONxA2vhVxYO2+yRDBgvV6ZkmC8P
	dFil3JUKhB1xYPIxl0Ctg1eiWuU3ymfM=
X-Gm-Gg: ASbGncsimBgpinVmmsxi7q7xLZCaug/Qjz3uxmci/wkM5T1oDsT7KOcuIN9CGOsiL0s
	a8DfQ0W+HsNPFwsQq/HQcdnF+7MIylqIsrboXCodw9kqX/xlJTwXJGkUOOKcFq6R0uK2of5++Vd
	+paJKIGFwmhRVErAUKRD5tva5DdY4jQ0vsEoDzGzjelGlUL4WnE6U+aWxEd1Of1j9VmPUXPQ4qN
	fj00SjCSljiSfMxMn09M1bWk+chz4xAhusd6pUqZ27HoHyuGF+TU8ZpNy/l0QCk6mdo5nF+
X-Google-Smtp-Source: AGHT+IGVtK1X6QVCCFl9oUOkghvq4uLoqfDGl5AxVVwOhFqg/9cS0AdZlrKDx+vFfKKDxtJFS1HxkFRUicMAHzHBZTM=
X-Received: by 2002:a05:6512:108d:b0:594:2654:5e3c with SMTP id
 2adb3069b0e04-595841f0b71mr2840106e87.33.1763265688745; Sat, 15 Nov 2025
 20:01:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1762482089.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1762482089.git.zhoubinbin@loongson.cn>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Sun, 16 Nov 2025 12:00:51 +0800
X-Gm-Features: AWmQ_blIhjJIi_40FrZPKnXO2gKNnDJthQwdyLwC4vAHP_LVBvLT1GG6sptkjTU
Message-ID: <CAJhJPsX537QiQZdk-0g_4RWVYGrhFasPrOY4Np+b-aVC6j1Urg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Watchdog: Add Loongson-2K0300 watchdog support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For the whole series:

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com>
Tested-by: Keguang Zhang <keguang.zhang@gmail.com> # on LS1B & LS1C

On Fri, Nov 7, 2025 at 2:01=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:
>
> Hi all:
>
> This patch set adds support for the Loongson-2K0300 watchdog driver.
> It's similar to the Loongson-1, except for some different register offset=
s.
> Therefore, I've merged it with the Loongson-1 watchdog driver.
>
> In addition, I've simply fixed some minor issues with the previous driver=
.
>
> Thanks.
>
> -------
> V2:
>
> - Remove file and function renaming patch;
> Patch 4:
>   - Update commit message.
>
> Link to V1:
> https://lore.kernel.org/all/20251029020847.1946295-1-zhoubinbin@loongson.=
cn/
> https://lore.kernel.org/all/20251029020913.1946321-1-zhoubinbin@loongson.=
cn/
>
> Binbin Zhou (5):
>   watchdog: loongson1: Add missing MODULE_PARM_DESC
>   watchdog: loongson1: Simplify ls1x_wdt_probe code
>   watchdog: loongson1: Drop CONFIG_OF
>   dt-bindings: watchdog: loongson,ls1x-wdt: Add ls2k0300-wdt compatible
>   watchdog: loongson1: Add Loongson-2k0300 watchdog support
>
>  .../bindings/watchdog/loongson,ls1x-wdt.yaml  |  3 +-
>  drivers/watchdog/Kconfig                      |  4 +-
>  drivers/watchdog/loongson1_wdt.c              | 89 ++++++++++++++-----
>  3 files changed, 69 insertions(+), 27 deletions(-)
>
>
> base-commit: c64c2a50cdd487e2270c875c1770cd55705d75ff
> --
> 2.47.3
>


--=20
Best regards,

Keguang Zhang
