Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D445224521
	for <loongarch@lists.linux.dev>; Thu, 24 Aug 2023 03:20:47 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-58d40c2debeso68228987b3.2
        for <loongarch@lists.linux.dev>; Wed, 23 Aug 2023 20:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692847246; x=1693452046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQa2QhUuD1nt00Z88tzVThPmcU90ZyELmtPGdBb+ofw=;
        b=Jwi4DWLdYpf6QREC1mr/nfaVh0UZQxqaJtHDL0yr8MDBvId8qT0kltDJBw0ZZxoV8F
         ScDdKfzRrf0bzZGSnyJN2JE73B6M8JTb7Gu1ax+7glvmS2vPJ6IH46kr5AmLr//+bPUQ
         zjNzTgr9MwscAswfXBsjBPqjpGSRDlxzAIuxLA+7/JFO/szgUkHDo9BvQ3tgQmBJwfl0
         0UQEYkvV8nH0TswkGX+zSVHXqcAYklPJdonmbSAoiZshJxPpMdd7jOLK4ei3wPc2EU8E
         zQMNUY0+seupupTYFCB3PthZ6UKD6qsdoGLFzXTDNf1iPmTW2sBk9NZfY5JZwSZiVKUe
         qGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692847246; x=1693452046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQa2QhUuD1nt00Z88tzVThPmcU90ZyELmtPGdBb+ofw=;
        b=ghX2Qf2bZklscxlEkbqGfDTh7qgj879a7u1XYNW+g/C3nOzVH2hzRqjL42qzzDblHC
         L9MDZhFdVHSELb9mMSp8N0RfuVpZOER1GEX7AYU/rAXuCy7Oz+yvvJuVNwF3lQdOrFMk
         FXI8pSQ040zdgFYKO8gf87Qi6Z/rw5qpWmzsxSmFULyEvVWolJxkp9giOA8XyTvTwH8u
         zosdhI+H/TIS0EbZQv955+y55GqmmMIj3BoI7d8DrS7pCO6Hohn56Xz/qClgcYTRVBnM
         X1jtlSoAhQQ3bDNyxc1kDuw4PplaVhEkt5CwN6JnxhkJdU4s6V5//N2gq8RV7XQunN1r
         yYXw==
X-Gm-Message-State: AOJu0YwIrpWHNqNzp9D5BIPl4loZz/sJufob0yG1t16zqCy1thOu3J/Z
	VEitEL1+90MS8IgPWRLL94fCUPpiP3xDEhf14kU=
X-Google-Smtp-Source: AGHT+IE08VXGpVtLDyG9MzPycaJeRexFCX1l1s8wa02GvSyqesRN9pe1dvaVQORBLjPPPlb+uFnirEm1bfrgpDh+YiU=
X-Received: by 2002:a81:6ed6:0:b0:589:8b56:15f with SMTP id
 j205-20020a816ed6000000b005898b56015fmr15027491ywc.24.1692847246639; Wed, 23
 Aug 2023 20:20:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1692783907.git.zhoubinbin@loongson.cn> <3e69929008c8190cff331941dd4d34f748e5e44a.1692783907.git.zhoubinbin@loongson.cn>
 <20230823194250.GA2768550-robh@kernel.org>
In-Reply-To: <20230823194250.GA2768550-robh@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Thu, 24 Aug 2023 11:20:34 +0800
Message-ID: <CAMpQs4KQzXYDsMJesGGRVX=e_psyiik-Th2Y0CV=keU+-v86mQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] LoongArch: Allow device trees to be built into the kernel
To: Rob Herring <robh@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
	loongson-kernel@lists.loongnix.cn, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob:

On Thu, Aug 24, 2023 at 3:42=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Aug 23, 2023 at 05:54:51PM +0800, Binbin Zhou wrote:
> > Some systems do not provide a useful device tree to the kernel at boot
> > time. Let's keep a device tree table in the kernel, keyed by the dts
> > filename, containing the relevant DTBs.
>
> Support for this in other arches was added to support legacy bootloaders
> with no DT support. You should not need this for a new architecture. Fix
> the bootloader to provide a useful DT.
>
Yes, our bootloader already supports DT.

Our original intention of providing kernel built-in DTS is to describe
all possible device information of that SoC, so that everyone can use
it as a reference during development; we will unlikely to add more
.dts files to the kernel besides the reference ones.

And as a reference, our built-in DTS provides the most basic bootable
combinations (so it is generic enough) as an alternative in case the
DTS in the bootloader is unexpected.

Does this make any sense?

Thanks.
Binbin

> Rob
