Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DE41396
	for <loongarch@lists.linux.dev>; Wed,  5 Oct 2022 12:55:04 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id m3so22824753eda.12
        for <loongarch@lists.linux.dev>; Wed, 05 Oct 2022 05:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oKnfwKM3GfRfs1GdFXL3EzRBmRr1ntc133LstIFT5HA=;
        b=o8QZPc5baW5MF1RQoJHAZH7Gt6DAVEiyOTNqCpenkZ/Dl5z9UvI5H3fyFiQDIK4bNg
         8cFH0jFD9HXfmdSsw2rB7YnGc0WNCyXNNMiT4zCg69K+sM5KZk00aK/qXiUAhfIGiGw3
         hWg7SpUmZGGt+zhkcT04eN66aKclL0eMvEfnExbzBQDRdstHUV+yiDNhuX/ZaX8x7viZ
         EQflDDyyW8t7y/pPTuicCw/TO2ma7EmB/EFjPgoWOpN3e0+mNrHys146rf7RsHDtSh4z
         mp98Gw8k6GoEv63xjZ1xGnK+DlTVKtX74it0iuHKbYK6XJlp6cyPKivTELOShdhfENpx
         LPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKnfwKM3GfRfs1GdFXL3EzRBmRr1ntc133LstIFT5HA=;
        b=oEdYoWHYoCJCwGA0qO7heyoXlDwT/n50t6sgm+OqvsCZ7nvQlLf98j2UE4fCozrO5t
         08uvJaHFiiz/dnETkeJHasEG+Z/hbpf6AXS90dVs8of3P9b50wuHCnkJ+ZIhyzUxSzRU
         5PQ0rvDPqLWPoWnA+NAg7K3VPjAD4WfNG4E59HUQfquxEmiPWm+UhPvyc9AlZSjyaC+8
         64EnEtEx92HVakV3CfT2+ynasWEJnrphWhxWNmZZWwDedEsmka9gPT0Ts70aeqfbdovb
         minLeBwUcz1KgvN8i91fy2o+7j3mCUoUsoLXQnJUGUhBE8VjYbHxYIopyqE4gs5J0n8z
         rrhw==
X-Gm-Message-State: ACrzQf3paMZB08PO6XZvKaXReGHGFLhhsl5fE8f6D2bm4g1/oenJCbRQ
	2EfLLD8AC/TMpltjWb+bCKqOtrKVNYB6bSCZEvA=
X-Google-Smtp-Source: AMsMyM4mEKd/pYQZ/4I5Ga208z8FXCa8herdyafq8+yOwo59j75Fhorq9MRycpNLUkv7W2+EH3+ORbMqUgxxYATCSmY=
X-Received: by 2002:a05:6402:1356:b0:459:3c9e:81d4 with SMTP id
 y22-20020a056402135600b004593c9e81d4mr10066457edw.148.1664974502908; Wed, 05
 Oct 2022 05:55:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Yz1t6rPLOzKT8Id+@debian> <CAAhV-H7FoDEEtqF_ZOwTGPeGK-4wpzsxEqvO+iuq=KpEuDUofQ@mail.gmail.com>
In-Reply-To: <CAAhV-H7FoDEEtqF_ZOwTGPeGK-4wpzsxEqvO+iuq=KpEuDUofQ@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Wed, 5 Oct 2022 13:54:26 +0100
Message-ID: <CADVatmOmtd0jfzNvpyMiQnN0nUn3qZFjLnTjxrn7km3p-grwpQ@mail.gmail.com>
Subject: Re: build failure of next-20221005 due to 4078ec1ef5ed ("LoongArch:
 Use TLB for ioremap()")
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Huacai Chen <chenhuacai@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 5, 2022 at 1:30 PM Huacai Chen <chenhuacai@kernel.org> wrote:
>
> Hi, Sudip,
>
> This seems a false positive. When the implementation of iounmap() is
> empty (but this is completely legal I think), these drivers will cause
> "unused variable error".

And that error will fail the build as allmodconfig will have CONFIG_WERROR=y.

-- 
Regards
Sudip
