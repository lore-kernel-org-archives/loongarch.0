Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A462120316
	for <loongarch@lists.linux.dev>; Fri, 22 Dec 2023 14:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzFBKPKx"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6db963bd3acso1276542a34.0
        for <loongarch@lists.linux.dev>; Fri, 22 Dec 2023 06:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703254379; x=1703859179; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imqf/e/Shk16E66k1OeD7FHRxpn8CsbV7RBcKZP0SW0=;
        b=NzFBKPKxMiOCzXP1Qj6H+pjjfxR0BD6Clg5YOgFMBudXPAisLjE89Lgu9nnDwwGUSO
         cCdZg8MgAeNk4HQFrPC9sQf5yMb6K8PBFfDC3O+XCqBWKlTlCvxu2YgAE3AjbDqQqcyA
         fSyVLsRGBE6Ezkyx5IYV0C3iwzWYnrwSdTZ42g1Jox1oje+pJQqVmsO1aY30xwrMVtWG
         q/7xSGXZbOeE6CqWo4HBgo+BbJzhrfyGiUEusvkKKD0JQ2Z4r07dFbE28CO0HQPnj1mQ
         72m0u9wf8Zfa9nw95wnxxdA1apx2FLbauCF0rptJZ/bH0wBCYNpF9gbn9qGi2pVGBZRT
         Lvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703254379; x=1703859179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imqf/e/Shk16E66k1OeD7FHRxpn8CsbV7RBcKZP0SW0=;
        b=P5J+4wLwEupGsPXEZvRlp13hIIvvsNiyxTIQra+eSrehSQSAn5cul/MsIDWkFVi7EZ
         qBuMZULBFXR7Ftf5j49SAxjKnRdr2qXte8aJHB3bJIIjcUQW76ZcfjPsVmNSg335j9NY
         XXOqHPNz6OH6zKfCFdCjJ1kapGqbogOsEAW++dsrse7j+eHwl8bahquVXld80z+eM0ep
         oNycaq0N8XlJBHguNr2pihHXD84OEg23Yhh7kEvopinsyXEMONxSC/9/Be7hWzRr/Wwp
         mEL41OK5Yw76VFcjRrd3LIlNZPy+bTNIDGOCa5lkLifLgJiIA3Dn8KGfU2nYbTBmXqWC
         PVAg==
X-Gm-Message-State: AOJu0YwQruKeBFjBGSWGQAlpOPmckdgrLLwDerA+/USuDld95hLacfUj
	7LwKsEe4FGdwvbdDN27yg+kV+rHFJ3lISa2X48Cd/hsLtwE=
X-Google-Smtp-Source: AGHT+IEcEaW7+zN0GwC8j+FF7nApdJ1N/jFY9PznfnkD0vXWFyjPt6AHnRWTUBnJPrrhWdQZmCtg7GJ93E6HP9RRNmY=
X-Received: by 2002:a05:6871:b13:b0:1fb:3700:ee1b with SMTP id
 fq19-20020a0568710b1300b001fb3700ee1bmr1431840oab.47.1703254379513; Fri, 22
 Dec 2023 06:12:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231211151105.7473-1-hengqi.chen@gmail.com> <f2c31a82-34bc-3693-a364-b6c3b85762cb@loongson.cn>
In-Reply-To: <f2c31a82-34bc-3693-a364-b6c3b85762cb@loongson.cn>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Fri, 22 Dec 2023 22:12:48 +0800
Message-ID: <CAEyhmHR2J-Hj6VQGUmi507m-AMfzAitr8UeuX_m7bwsNHzRCNA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: BPF: Prevent out-of-bounds memory access
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: loongarch@lists.linux.dev, chenhuacai@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 22, 2023 at 7:40=E2=80=AFPM Tiezhu Yang <yangtiezhu@loongson.cn=
> wrote:
>
> Hi Hengqi,
>
> Thanks for the patch, sorry for the late reply.
>
> On 12/11/2023 11:11 PM, Hengqi Chen wrote:
> > The test_tag test triggers an unhandled page fault:
> >
> >   # ./test_tag
> >   [  130.640218] CPU 0 Unable to handle kernel paging request at virtua=
l address ffff80001b898004, era =3D=3D 9000000003137f7c, ra =3D=3D 90000000=
03139e70
>
> I can reproduce it with gcc 13 and binutils 2.40 on Fedora 38,
> but can not reproduce it with gcc 14 and binutils 2.41, maybe
> it is related with compiler, I am not quite sure.
>
> > So, let's access next instruction only under `dst =3D imm64` context.
> >
> > With this fix, we have:
> >
> >   # ./test_tag
> >   test_tag: OK (40945 tests)
> >
> > Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
>
> This Fixes tag is wrong, because the code is same with this patch in
> commit 5dc615520c4d ("LoongArch: Add BPF JIT support"), the current
> code is changed in commit bbfddb904df6 ("LoongArch: BPF: Avoid declare
> variables in switch-case").
>
> So maybe it should be:
>
> Fixes: bbfddb904df6 ("LoongArch: BPF: Avoid declare variables in
> switch-case")
>

OK, my bad, will update the fix tag.

> > Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
>
> Anyway, the code itself looks good to me, feel free to add a
>
> Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>

Thanks.

> Thanks,
> Tiezhu
>
