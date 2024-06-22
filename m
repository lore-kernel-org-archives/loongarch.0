Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B417FB
	for <loongarch@lists.linux.dev>; Sat, 22 Jun 2024 02:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719024606; cv=none; b=ntm3LXkQIjlXRlvI4CEaHH+0t9hRlGUmU1jFFTit0uJCcDoQ0NqYsUfBWDVf1rRdE1PQW6Icy3cCr/izvpvD/QUxxgWHi5pwQ/anc3oHw9YKxKnF5zMYTeNQyTR94+DQ22G++FlCAe1FDJAY9ndKv2gE9M6uRl5fGB10/sKaBtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719024606; c=relaxed/simple;
	bh=MxOTiAGZjwuFbedhzSvB3ixFs1u3Vzg33PRF5PSvKjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jykhoyoyTORgJHxC6QU0wCC4zCC0V85YYrUvbw6meQcaEt5CSCwah3wXJYClEYS4ZaYB0HL8oHY/mRAeMoP34OKMiH5pnU1IJlJPWJNEBiTz8sZOnydR6f2zcDXmhiOc3Y4Cm6jyBVsfQuW96o4g4eEg9fCHh7gFFgaDKqG7ZAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B8lzoek5; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B8lzoek5"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6f11a2d18aso295343966b.2
        for <loongarch@lists.linux.dev>; Fri, 21 Jun 2024 19:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719024603; x=1719629403; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4pRzIAtXesY3Se8kcF/OROsXtbtTY54OQJkhiu98SfE=;
        b=B8lzoek5OQgyZjnjKxQ4qGWRo5X54/YUx+dHrPzUTd23deqBRRNZi+mCc9w4KdDwHD
         vMZJKSduJZTeZQMxPArnqpwHVH0C0eix+KUw7HZ0lbzCNtJCPsV/ayANpd+H6JxpfXYQ
         4TAB6pp7nmAE4Lpjxe4JeYXdYpttTag1JUqqGVp6EV+MkO1jvOgsvw3XpQ5kygikku5b
         Z0hChJUJNOwZQrS8UM6xaLsNInE6lissa9gLOZd6cDBHK6SsZYjc9fbW9Q+krWlshNoD
         iyLgKto+zVuY+yOilDF/5cW+/WQqzMTBuu4b4RnTHAGpaoAXhYRybHyPlbRwPbDhMAwd
         9QVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719024603; x=1719629403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4pRzIAtXesY3Se8kcF/OROsXtbtTY54OQJkhiu98SfE=;
        b=G8mY/YlSfsLH9KIVFHpv+LJH4czMGsvk3nA76LkOX7VkTg7Jnslp1iCjNOpm5EVBDA
         928FRTYBrQNXEXqVyEXzCiXuOZA8QoQqc74sk5TPpNfFT+UkrXND1kFYBXaAXaQhcv+c
         OriPz4eBb+65Gzd1SS0gIGWCXDcEwWW3Mw02cW4rcw54EPGdEgT2+8GDguf/P0iFlLZP
         f7mfCMR17PhdE6jTbUKKGRVTbU1rnewKFTMkHg1Lc6liNKXZv1RX1Ol92NSVt1UpbL3o
         JST8nsvhEmkLGsrx1Lqg0Dl3yBHj7nwxUcEa+cZi2pLI6lWv8jrYSGH3r6VVVVcPSpIn
         osQA==
X-Forwarded-Encrypted: i=1; AJvYcCVhQh9OxokCVagnjlUFUnjz+8pYzvhXv4dLQUinebZqBx4IGuIKar/MbSnkIVOA+iEGmh5LlROiNaCWRnUHqLTuhDhaxeowZwox
X-Gm-Message-State: AOJu0YzngFwtgPBXCXQ7cSdcT+A9dhjIlNRJ/8PHe9Ti2UYBquAKAPfq
	peGXKTCELS5/InBMMpvTsRohUUAMa6llKia5bFW7evAsFJXRwPM22Vf/eGBggMOxqvNlPTnergs
	6EFlqgVaR5+QaCcBIZk5gKojh5GyfEir6Xps=
X-Google-Smtp-Source: AGHT+IEUeAxjghJEFotw4ajRoivTMhkPmu4wnZshebL61xJv2U5EpFvkNBQExKTrQ7GjYfL6B2yKvEpht6zpxzydX5Y=
X-Received: by 2002:a17:907:a684:b0:a6f:b284:4279 with SMTP id
 a640c23a62f3a-a6fb28442b4mr570501766b.36.1719024602231; Fri, 21 Jun 2024
 19:50:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240620020625.3851354-1-chenhuacai@loongson.cn> <87msnem3i1.ffs@tglx>
In-Reply-To: <87msnem3i1.ffs@tglx>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Sat, 22 Jun 2024 10:49:50 +0800
Message-ID: <CAAhV-H5TNnf+EMEtKmXk+Q9KXSZpW+9vd-7qqXDifsKfny+v=g@mail.gmail.com>
Subject: Re: [PATCH V2] irqchip/loongson-eiointc: Use early_cpu_to_node()
 instead of cpu_to_node()
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Thomas,

On Sat, Jun 22, 2024 at 4:42=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Thu, Jun 20 2024 at 10:06, Huacai Chen wrote:
> > When we use "nr_cpus=3Dn" to hard limit the CPU number, cpu_to_node() i=
s
> > not usable because it can only applied on "possible" CPUs. On the other
> > hand, early_cpu_to_node() can be always used instead.
cpu_to_node() depends on per-cpu area, and per-cpu area is only usable
for "possible" CPUs.

>
> We use nothing...
>
> Aside of that you fail to explain what the problem is (i.e. the
> malfunction) and why using early_cpu_to_node() is fixing it.
>
> >  #define pr_fmt(fmt) "eiointc: " fmt
> >
> > +#include <asm/numa.h>
>
> asm includes come after the linux includes.
>
> >  #include <linux/cpuhotplug.h>
OK, will modify in the next version.

Huacai

>
> Thanks,
>
>         tglx
