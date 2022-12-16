Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077F4371
	for <loongarch@lists.linux.dev>; Fri, 16 Dec 2022 04:37:31 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 142so1029117pga.1
        for <loongarch@lists.linux.dev>; Thu, 15 Dec 2022 20:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XLygs21yUm+BsQ9K/jaILqjtoVN7cCv+GmldKd5jCoY=;
        b=atuW7kj1tICjX6XOEoGlMKRElIbgy8WI/deoKifcFx1519QZRpDCOoxmKj7EgE2l4w
         PKzJI7L2ZbVuy2LOhWOolJwT0c6HGC5z3GYIC7j6xM/AunIUu1/hMOhZv9S06C7VFhC1
         4Q2nDbmd0YUF9RndxPqP2p/GdMMZ3K4yhoxZk3FVJ0hYXbi4IN4jZVfHJrGPnQoXbTYJ
         YAB5z7iNwRy7E4EGbWHbVIEyT9ICXQ8iqfiE3z4SLn1NrJW7NLywpAeLKJB/g9wvfmaM
         r5jcdkMrnO+dY5EbBAyyZATVFCQYX6igkBalPuLJ6BkhstYEmOV58RsJNRueXOX7Ax8G
         6CbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLygs21yUm+BsQ9K/jaILqjtoVN7cCv+GmldKd5jCoY=;
        b=Qz7pTQkt9wpiCn53PCuzJAEL3V424PODzClVwrYEAtIgLgqOpDuJoWybtO9I+eZ6Rk
         ieQT1TYI7Tce4aALemgbZMdzBOjGakYGtaDj8wWEVlRGpqZKecC+k+57tGaHpENh3iLT
         Zj0MIDmpwfdFs+J++EVWNhqTFOGYr8LvIggSu3KyNFkfieK88fpGEbtX1NDzF1mYXi8o
         VxIiExr8iR2zebB+rvURFwnAa0Kp5DwmgcNdLE+PdprG/ckHbIIL505T1OUrnNuv2ohl
         99CUknTQZqh2TxyVY3YP1Q8oW5Vvj8GI5cR7DWQVD0GYmyBGRXkTkwrF1UbetK0X6Awu
         xnxg==
X-Gm-Message-State: AFqh2koi3XH3PqRU2QRytXf3rEDq6+Sp4y9oF+eNsmuI9xWZY/uMs1+/
	bixpiVjDNUuDjqlbTC8LXOdfJAKJvmP45yQIkGk=
X-Google-Smtp-Source: AMrXdXt5JWumad1PiboheGKsXmVaNjeH8snNXdAqZ+Iojn+pij8j6t8nwEgKCk6P8kauAlDPnokzu+Szv1Dew2bD4rM=
X-Received: by 2002:a63:584c:0:b0:484:2672:2c6a with SMTP id
 i12-20020a63584c000000b0048426722c6amr142358pgm.535.1671165451321; Thu, 15
 Dec 2022 20:37:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <639b23c8.DdUNqMCLdxZ7gLv2%lkp@intel.com>
In-Reply-To: <639b23c8.DdUNqMCLdxZ7gLv2%lkp@intel.com>
From: Vincent Mailhol <vincent.mailhol@gmail.com>
Date: Fri, 16 Dec 2022 13:37:20 +0900
Message-ID: <CAMZ6RqJ7-GTPe7tNdhTYCF6OrnagfNL_7EXrhn5HD=YB8dtCGw@mail.gmail.com>
Subject: Re: [linux-next:master] BUILD REGRESSION 459c73db4069c27c1d4a0e20d055b837396364b8
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-xfs@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-arm-msm@vger.kernel.org, kvm@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

On Tue. 15 Dec. 2022 at 22:57, kernel test robot <lkp@intel.com> wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> branch HEAD: 459c73db4069c27c1d4a0e20d055b837396364b8  Add linux-next specific files for 20221215
>
> Error/Warning reports:

(...)

> Documentation/networking/devlink/etas_es58x.rst: WARNING: document isn't included in any toctree

A patch for this warning is on its way:
  https://lore.kernel.org/linux-next/20221213051136.721887-1-mailhol.vincent@wanadoo.fr/T/#u

(...)

Yours sincerely,
Vincent Mailhol
