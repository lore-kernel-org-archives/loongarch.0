Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F146FD3
	for <loongarch@lists.linux.dev>; Sat, 22 Jun 2024 02:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719023120; cv=none; b=cD02u4kpWHxmcHXiI33bNLumZT7gYwK/AV+McDV5H5ZTODX8H+AKcvYHSm3jJdl0HEGDD0FUyEwTScp1DhhtXp0u9P81r8CWYIeY398/HXY5D7X0ihJtFxFj6nDYqqsyWdxbkHZsdSvZog7rYEnp+bmTGT0WphvYgggXFkZmNrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719023120; c=relaxed/simple;
	bh=GcsQc9ikcH+AJbdBZArT/RxNy3TLtgnk1xbAAfnItBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B6+bXKhEI7QLpt4zknAOZLE8uiwG8T42y5LLRZM7sj3gZSm4clupNsnC3+C4t80yAkvFMpRM1lVnmL68f4DEGy8o/0mw5dGazm4O70U+U7cnP9r03CyxcanKPtm1ePyGe1YiMq9Inx2qe3wSuES7yK7KyqBxHbzF/qBzL3tr2Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGrtmcqn; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGrtmcqn"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6265d3ba8fso271298166b.0
        for <loongarch@lists.linux.dev>; Fri, 21 Jun 2024 19:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719023115; x=1719627915; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoLoLenO2hn+yBjuCLcTOSia4khLZOUwCxfFgSKuOrc=;
        b=eGrtmcqnE8Xq5qWV8D9NQ+qY7Sg1AU+ayxE46VLOIFv/cerQCSg3orRIKiFkFwiDhA
         hIlbQtKBZyFwsDU9xdBbiWLry/Bh8LfZTEeytXo9kZJMrbvILzDKho1kZgsO86iEHLfn
         ZMmQKksj11Nc1BgYjnadEwOoKJ0eCGIeAPgeTHR4ZB96Rj/mL2s1X2ciGk/cwaNwXZpv
         3FwFwtGYjlvTXTFyeKkLtZOSlgkOZD/cvaigP6zvMN2tJuOnR5TFtfxqy5SfL6GShGJA
         Z5N1roGROKiiBOTgsNoyCjoZLq3CMvsD8DR7GBoSZWWNCvC9L13lfyWbHNeXLajr4nib
         r+CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719023115; x=1719627915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CoLoLenO2hn+yBjuCLcTOSia4khLZOUwCxfFgSKuOrc=;
        b=LPnbUMVv36JhOx0oliigrhQMXe48xoOKRiMfgecLsdn0zVpEqbx+P6szPXDgGTSjiu
         g9yr6rBXWliEMZSI5yZusEPgqY1sguXItqvHmiqO3xaXXW7W6+y4jzpfB4/MzufJsM2l
         aYBA/06cPzwShykLvh8/036QGfvb5/ncnimxvOYS/eFKr6eKz/BJFqiDcZSY2tuG6BNx
         7ejaLrZWFLtEVcwwb3HhXO5aIsLotyzPJALLIjMz5UffErbF8cI2EbcqY6/QUoclUD6/
         LdcfFEFHcqgxRGh8A/6ppBEg0elgCFVwE5XoGDDxNInuRCZ5c6aCdMsYmqJLK5tnwarx
         tJsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWcaDSDKRv63Kc70rxLqR7nM3BVkmBNSSsWMl/krSoSXPQWSZqqFwfKu6kkRpuDecIqcwJbYEgZRTTOSJicIlZrJ1NT52CXxqm
X-Gm-Message-State: AOJu0YxwI4FjD1W44QW+rCoE7REQd3YTdblgf7ziomrXFjc3MEK/3U3B
	7g2WEYNn4VT81QbOiTpx7RnCmvjW4hs5BUaELbh9wX6b33pnftexa5g/UYpW4DgSSe4Yy7qiRT7
	OcWuFRFxk9L1VKV14A0L5eJ8TQUM=
X-Google-Smtp-Source: AGHT+IGqzP7BZpP7VUAnHz9SkGuXTFi3N5BNWqoIKPnVV15CHSzOWqVEK6BFwL2z9M5eh6vtIgyJmGbibXlXL5xBKlE=
X-Received: by 2002:a17:906:cb1:b0:a6f:f7c:5c7a with SMTP id
 a640c23a62f3a-a6fab7cd635mr495493666b.67.1719023114713; Fri, 21 Jun 2024
 19:25:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240612070106.2060334-1-chenhuacai@loongson.cn> <87y16ym966.ffs@tglx>
In-Reply-To: <87y16ym966.ffs@tglx>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Sat, 22 Jun 2024 10:25:02 +0800
Message-ID: <CAAhV-H7w+iHwXXzxVHzer7MiAVgU7v3DFuoWuKm5UWkUQoqeQA@mail.gmail.com>
Subject: Re: [PATCH] irqchip/loongson-liointc: Set different ISRs for
 different cores
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org, 
	Tianli Xiong <xiongtianli@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Thomas,

On Sat, Jun 22, 2024 at 2:40=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Wed, Jun 12 2024 at 15:01, Huacai Chen wrote:
> > In the liointc hardware, there are different ISRs for different cores.
>
> I have no idea what ISR means in that context. Can you please spell it
> out with proper words so that people not familiar with the details can
> understand it?
ISR means "Interrupt Status Register" here, I will improve the wording.

>
> > We always use core#0's ISR before but has no problem, it is because the
> > interrupts are routed to core#0 by default. If we change the routing,
> > we should set correct ISRs for different cores.
>
> We do nothing. The code does.
>
> See https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#ch=
angelog
Let me try my best...

>
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Tianli Xiong <xiongtianli@loongson.cn>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>
> This Signed-off-by chain is wrong. If Tianli is the author then this
> needs a From: Tianli in the changelog. If you developed it together then
> this lacks a Co-developed-by tag.
Yes, here we lack a Co-developed-by, thanks.

Huacai

>
> See Documentation/process/
>
> Thanks,
>
>         tglx
