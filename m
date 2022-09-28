Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA907F5
	for <loongarch@lists.linux.dev>; Wed, 28 Sep 2022 05:25:49 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id s10so13138471ljp.5
        for <loongarch@lists.linux.dev>; Tue, 27 Sep 2022 22:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=IPCLwIQ+UERHPm9w4nQGFYrwmlLzJ4AJ3JlVNkOLjfk=;
        b=owmaWL8J0DjnByEMa+cLbTORIRrq8yp3lKV8crjvgMM/NkKnWeQIxzmI5VTzceEs3i
         S3i46YmZL6hhUlOZgye5isjPYmsTL9s7ZQbh4KxfmQHhPEMfq8R8W01RbLcG9+VJVBK9
         8fBxKiJNmH3HTgTCP9QbaG5As7Xex+3GS9vMzEkw0RXkyxtNit3zG4NH6cmFKNhRPLcJ
         1wpCfkC3/obFIyVNyGRuEV+B6a4cqc/MfTeighQRcl1evlTq2RPNa22Fpm7esVybK8t9
         XiN03BRQL3c+PNAEazrBabL0xPu6A+N1Pr1UnZe63PhoxCuf5jkappeLkxgBidmJu+mi
         rgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=IPCLwIQ+UERHPm9w4nQGFYrwmlLzJ4AJ3JlVNkOLjfk=;
        b=E4MsRy3xf1PSw3eAn8thfvYBBRyhMV5ggC55BnE67fEjouhJxHWfDIMkS7fGT36/on
         Pl/uGs73K+hXyjG8++67uw9bn5uQ6gZrm74ZpLlv5GGyYIjgvjornlnRGNkeYcRa8rHl
         xpOrk98+cv8tAdqK/+iPNqVwcOYZU6BmGgvAg7krcKNwGuQJwunOEWgpCB6khGFHgZRO
         5t+ygogw+RSPb9qYhAB60+Vxs9QaNZGeoDQEWmWKFVNBxTe7E4jpuJh0B1blnWVHjxhf
         A6v3+7snWSRtUrfPtqyYyIpNG9cVnB05CIsvXruThQ42XzEhLgkZxp8h9Uvhz5HRxfAF
         DNmw==
X-Gm-Message-State: ACrzQf1ZhY8DeL18uKFtReRZQW0BPvIT2v6GOHyHzITQIFboU7ajTgSS
	L2il+NsCaK0FN1CNxYoYwihNEYWdXUyq9zOGYsvt+w==
X-Google-Smtp-Source: AMsMyM7wMhHzCDPMFbCTrNC4bpJlQfmpId5OarS9R/571Zfneoaf+BQ5BEj/3dPyNZFm2pWs5O4V9tiCRmerzE31Li4=
X-Received: by 2002:a2e:3909:0:b0:26c:2ea4:1a79 with SMTP id
 g9-20020a2e3909000000b0026c2ea41a79mr10902755lja.401.1664342747490; Tue, 27
 Sep 2022 22:25:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220830193701.1702962-1-maskray@google.com> <20220910075316.no72fdyqjvunomwm@google.com>
In-Reply-To: <20220910075316.no72fdyqjvunomwm@google.com>
From: Fangrui Song <maskray@google.com>
Date: Tue, 27 Sep 2022 22:25:35 -0700
Message-ID: <CAFP8O3+OwanSJdzd5V3oGJ_MOJOSVdbn+4iBJJKm2LCR8mCA0Q@mail.gmail.com>
Subject: Re: [PATCH] vdso: Improve cmd_vdso_check to check all dynamic relocations
To: Vincenzo Frascino <vincenzo.frascino@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 10, 2022 at 12:53 AM Fangrui Song <maskray@google.com> wrote:
>
> On 2022-08-30, Fangrui Song wrote:
> >The actual intention is that no dynamic relocation exists. However, some
> >GNU ld ports produce unneeded R_*_NONE. (If a port is not care enough to
> >determine the exact .rel[a].dyn size, the trailing zeros become R_*_NONE
> >relocations. E.g. powerpc64le ld as of 2.38 has the issue with
> >defconfig.) R_*_NONE are generally no-op in the dynamic loaders. So just
> >ignore them.
> >
> >With the change, we can remove ARCH_REL_TYPE_ABS. ARCH_REL_TYPE_ABS is a
> >bit misnomer as ports may check RELAVETIVE/GLOB_DAT/JUMP_SLOT which are
> >not called "absolute relocations". (The patch is motivated by the arm64
> >port missing R_AARCH64_RELATIVE.)
> >
> >While here, replace "egrep" with "grep" as "egrep" is deprecated in GNU
> >grep 3.7.
> >
> >Signed-off-by: Fangrui Song <maskray@google.com>
> >---
> >[...]
> >
>
> Ping.

Ping^2 :)
