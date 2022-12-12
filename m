Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4CE7B
	for <loongarch@lists.linux.dev>; Mon, 12 Dec 2022 08:17:21 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id v82so10533665oib.4
        for <loongarch@lists.linux.dev>; Mon, 12 Dec 2022 00:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c4gMDZhGwu0Ykbz3qv7uQC3nOWgJ8Dr0VLnEwsUdVFc=;
        b=MCH1mZ6rw34l7dfiP2HPgVzejNItACr8J+CzSpIGYECwK30m0nFv1I0m3Wunj7pDXi
         DNx81JL+ofmxXmfye7rEqtZDTgXRg+p9W0MpTQtgWQC1ySv0otR+4yrn3EDfaFLm6ra3
         Fhq+peR0m0yEC74wWe6pf/zPqbVSVXv/dvCUtdasDUxYOvnJ+UhsMTUVc+OdRfyyY9Rz
         gp2FiJ8xgA4mdhXnp2WUbmNqN9dA6Kk/AoSu04i2xRB30eJimyI84cN39R7wfQDHbC60
         qz2uY6R6vz+NC2jQOo9ICC+0XETv7AkQLQUXjWS1Ch2Qd4Uf3wA3jZUaj7yVlLNFL0vQ
         dNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4gMDZhGwu0Ykbz3qv7uQC3nOWgJ8Dr0VLnEwsUdVFc=;
        b=Tx7lTvx6xnSF5K8nCvl0IOpUhk58lRi6hls3sBHfm3gDh9BdBMFrB8k3sYITmZfDnu
         jq0lUUPOvNmqnKYpLi5VWVdnCAKVCwlnVg/5i868LAGjrUlFaFUgGXRwPz9mNdqvT1Zp
         ySyv3gIdO9FE7P9rjSM9iXC+fPTHz254H1z/P+xsP0o0t5jfOns/Jc7yisRF8yohK6qv
         h2tVrpqtYZ2QM1cDphcWdXyMkg0VhVFvBm90zIHceMIr7jCmGt+GTkmC5KCEWCfguOd2
         A0SXIvW5pLnt2EjmPgdbSY17+lBsN3XSb8552Nyq+I0UfuJ8bpqWFkicvFeWkCEP68Os
         cCyQ==
X-Gm-Message-State: ANoB5pkIeS/HNR1BPG9tYMg8Hcw6VqCtzHItyDnWWjrSmJANnlEo0PMt
	EvIjLWOMn/aznhra9Er7mdtHkt/0fFiGcqCrqTg=
X-Google-Smtp-Source: AA0mqf5lkAG4R17bx1n1GyzzFa2pF0LzaVpDKb1ElCO3thG2XVmsvyLomwDD6ry2nDk6YSPpXtygLyNjZzkHhvZPjqg=
X-Received: by 2002:a05:6808:214:b0:35c:149:3428 with SMTP id
 l20-20020a056808021400b0035c01493428mr11788222oie.180.1670833040572; Mon, 12
 Dec 2022 00:17:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221204141027.2511383-1-hengqi.chen@gmail.com>
 <CAAhV-H7F5R6gVR4KufBitusg5A++z-1cJjnMdNLCYg2EyzafLw@mail.gmail.com> <2ca97911066ddb8eedb46d75d5446f45156f65cd.camel@xry111.site>
In-Reply-To: <2ca97911066ddb8eedb46d75d5446f45156f65cd.camel@xry111.site>
From: Hengqi Chen <hengqi.chen@gmail.com>
Date: Mon, 12 Dec 2022 16:17:09 +0800
Message-ID: <CAEyhmHQT5FumzU=wCRwo6R6qc8BBnD-u17VD062k0wDetqRWiQ@mail.gmail.com>
Subject: Re: Question about 'ipmi_si IP I0001:00: There appears to be no BMC
 at this location'
To: Xi Ruoyao <xry111@xry111.site>
Cc: Huacai Chen <chenhuacai@kernel.org>, Jianmin Lv <lvjianmin@loongson.cn>, 
	loongarch@lists.linux.dev, Dongyan Qian <dongyan0314@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi, all:

Thanks.

Now I am able to compile and run using:
    https://github.com/loongson/linux.git loongarch-next

The issue is on korg repo:
    git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git
loongarch-next

cheers,
--
Hengqi

On Tue, Dec 6, 2022 at 1:20 AM Xi Ruoyao <xry111@xry111.site> wrote:
>
> On Mon, 2022-12-05 at 14:06 +0800, Huacai Chen wrote:
> > On Sun, Dec 4, 2022 at 10:10 PM Hengqi Chen <hengqi.chen@gmail.com> wrote:
> > >
> > > Hi,
> > >
> > > I built the kernel using loongarch-next branch, had the following errors while booting the newly-built kernel:
> > >
> > >      ACPI Error: No response from Global Lock hardware, disabling lock (20220331/evglock-59)
> > >      ipmi_si IP I0001:00: There appears to be no BMC at this location
> > >
> > > How can I fix it ? Thanks.
> > This is "harmless", but I think Jianmin Lv can provide some detail information.
>
> "ACPI Error" is likely something imperfect in the firmware.  Such errors
> frequently show up on x86/x86_64 systems because the vendors use a lot
> of Windoge-specific hacks in the firmware code, but mostly harmless.
>
> Also + firmware team member into CC list.
>
> --
> Xi Ruoyao <xry111@xry111.site>
> School of Aerospace Science and Technology, Xidian University
