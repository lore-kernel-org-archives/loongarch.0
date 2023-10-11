Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E0B1D6BE
	for <loongarch@lists.linux.dev>; Wed, 11 Oct 2023 13:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijZdGLGU"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c1854bebf5so86960281fa.1
        for <loongarch@lists.linux.dev>; Wed, 11 Oct 2023 06:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697029726; x=1697634526; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYM9UN1cQM24eN/cx1yRvLKv4WydXJJTwKdXLA9EWM8=;
        b=ijZdGLGU89hMQezOqOc6q7FH3d1g+hbbsI3Emr27ixpVzZnowWtKrO1NsLo2wuAerV
         9UqIf4Xu/tlOqhrd50zCHiFtBw4NWcGxStKCkoEAWzwUIaJNDr6gAQLvMUwn06XfyAC0
         TFyUUKQ+ZKxaYsMZ/QWdXS8suKF+fbP/4o08kNnzNGGDmJLuPEcjqzHmnZHWNxLasAYT
         Dzk7qo/IWq9XGISQjnvWE4Uc0Rc/cDjNsBcok7V1rf5MmVm8VvQUtV7lXXYQwrxbfhtv
         2NyIQ5FgcXwKTHoNnOi3p99wd0gu28xJAznqVISANeeFopmjKyHv6FlMb/e0VmJfRPan
         Rx7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697029726; x=1697634526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MYM9UN1cQM24eN/cx1yRvLKv4WydXJJTwKdXLA9EWM8=;
        b=ZdxnpDBmO3ozWoXpAjSOM6FyEyM3h4d1tAdMUW3I5XpjGWlynVwbz+sshJBb5qt5DX
         bUmx3FQLZDgJxctadxnL6Felux7wHBzaTx+l/60SQ3As0mC6bVsOzb3LKkXeZqSvVSh+
         P37KQhIim9gZjhQP1IL3bW8Nqugnx9ejJlrrpPS0qmbelKmMQXAITbOD3TAVM1OJbj/k
         8IPbOC4AjUjjtdT9MGE7Nm+CrF19XUVFGrIFeGpXSGcAbXU2KuC+iUJhvClw2/7Jvtgg
         IgZK1F/oJB4LAWEsu/kqEswCnz87VRjh0EwzW5u+gVcMAhhHiE90DEvDzsFkM3sfjTU5
         /0tQ==
X-Gm-Message-State: AOJu0YxHyBxFfEmtafK6BM99+GkeZqBfsTfXQL2lJYkbzH3BtNYEc+r3
	9Fm0XsEagKOwZ7jak8LZBCGPL12nQHqjjnPV7po=
X-Google-Smtp-Source: AGHT+IEjN10vumMrnkaVLm49rRcsyi0oHpP0pF8gEAjsR7W/99v8G6qx2BYXKqogcr2nJ1Z3MXtFLamAEVvS47wud0A=
X-Received: by 2002:ac2:4431:0:b0:503:258d:643c with SMTP id
 w17-20020ac24431000000b00503258d643cmr16419640lfl.21.1697029725500; Wed, 11
 Oct 2023 06:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <E1qkoRr-0088Q8-Da@rmk-PC.armlinux.org.uk> <ZSV6i4pnjQqvWuKp@shell.armlinux.org.uk>
 <87o7h5l5xr.ffs@tglx>
In-Reply-To: <87o7h5l5xr.ffs@tglx>
From: =?UTF-8?B?VG9tw6HFoSBHbG96YXI=?= <tglozar@gmail.com>
Date: Wed, 11 Oct 2023 15:08:34 +0200
Message-ID: <CAHtyXDdr_R_Moypb3ieFs54RRGu+zqHS46WrjEvWCFtT0KZRaQ@mail.gmail.com>
Subject: Re: [PATCH] cpu-hotplug: provide prototypes for arch CPU registration
To: Thomas Gleixner <tglx@linutronix.de>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-acpi@vger.kernel.org, James Morse <james.morse@arm.com>, loongarch@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Ingo Molnar <mingo@redhat.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, 
	justin.he@arm.com, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	x86@kernel.org, Salil Mehta <salil.mehta@huawei.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-ia64@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

st 11. 10. 2023 v 14:06 odes=C3=ADlatel Thomas Gleixner <tglx@linutronix.de=
> napsal:
>
> Sorry for the wrong information about ia64. The removal did not happen
> because someone stepped up as a possible maintainer.
>

Does that mean that the removal patch will be reverted soon in
asm-generic and linux-next? Both have no ia64 as of now, and there are
already a few patches without ia64 part (e,g,
https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git/commit=
/?id=3D2fd0ebad27bcd4c8fc61c61a98d4283c47054bcf).
Without the revert, patches affecting ia64 will conflict.

I am the person who volunteered to maintain the architecture. If the
removal was indeed cancelled, me and Frank Scheiner can start testing
and reviewing patches affecting ia64.

Thanks,

Tomas
