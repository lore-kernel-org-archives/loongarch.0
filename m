Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1A77B
	for <loongarch@lists.linux.dev>; Fri, 30 Sep 2022 07:22:29 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id c9so4242468ybf.5
        for <loongarch@lists.linux.dev>; Fri, 30 Sep 2022 00:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=XGGLlua7GXMuc36QzLfRv6BdbYRPzApkiA3VNvmfEWQ=;
        b=I+9KmAvj3PdBEA50JYR+BLHn6puwGXK07eiZIFqlVSPPQyLOJqIZa5l5eaCGQQhQrT
         zTtCn7+n83Svcn8Wc8sghJNuqwciTIHfgN8fDmLjdWwahcXOjhaSVhg4u4vNSAc+kMjx
         HpGuvg7xVWGl1RaEdOeU9r4FLE8xDupjK3cnBsI+nM1QZmyGvhWUI+54plU+DfKFOaB3
         6yFwMR4m2K8MWWNx7mKmma8kgR7++t7bu0Bag032oKL57qWHVunhN68EDxGYdp9j0wAh
         c1b+GfjCadysQMS0dZLV2D2R5uj+9uTOH/3Dm2D3yzz1nvYxmA6z5H9/iFqnyvCX0bJR
         kGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=XGGLlua7GXMuc36QzLfRv6BdbYRPzApkiA3VNvmfEWQ=;
        b=WAE8goRmd+iTy8baIzVvbp0CvCNSJpXcvMY4KIZMsLNJUuYqTanXvzKtYvQ7hmJRi2
         aMNwemF+P2SsHrjCk2QH7R8l8kRol4hPCJSO2Mu1cxWnjFODM+UfK3nXIRzerwV/jynF
         iux7cPJ9mVCLDZ4Lb7CxqM4/0+Oe3DAFwqkBb+JFJvIwwPwlAGoWIOhuU6v4QqnQ6op4
         orwtmhirY5js5hd6bn1c28QHdrDfOxIzxKQv5wOh9jsavNaApGFYzJBLnnoBLKaG2fy/
         tA0VLmtxcymLnzvgOmirIwgU8oqWJVnY/rUGxSXsz81EtQXFPtXoFVQq84lLsAjVxQa6
         i1Kg==
X-Gm-Message-State: ACrzQf1q5X+12rIxc75EgQ5mIXwcNWTALf47PUkumSxEPMOLrFOd1OGK
	B8sriCSZUEy5Dyp3xDBp6Pc0OIIuq+lZ8Vh4bKEw/CvnQjI=
X-Google-Smtp-Source: AMsMyM6xWjPtwK06Sz1UuC19YFA2WThQGHUIYDVfOu6dW3rkut9e/g3MtFcNOAglopyzlzz+n9OWctNEtOoCRd5YQwQ=
X-Received: by 2002:a25:d0a:0:b0:6bc:f7a4:b982 with SMTP id
 10-20020a250d0a000000b006bcf7a4b982mr1223442ybn.77.1664522548389; Fri, 30 Sep
 2022 00:22:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220929101445.32124-1-lukas.bulwahn@gmail.com>
 <CAAhV-H6xe4o0upxcQTN=8BeDdcDipmoRp+QQNiakJJZ_eneTxg@mail.gmail.com>
 <CAKXUXMwhF4V1=oNq1XaTmQpk_Tt7ZXfZEmK_r_GT6wz7=vVx2g@mail.gmail.com> <CAAhV-H4dExTGW7=pSPmunFVBK6YYjj-wo0ZKgfi9A=yHf2qV9g@mail.gmail.com>
In-Reply-To: <CAAhV-H4dExTGW7=pSPmunFVBK6YYjj-wo0ZKgfi9A=yHf2qV9g@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 30 Sep 2022 09:22:17 +0200
Message-ID: <CAKXUXMw731xNrqUzrCE1jRd25vfWdYFf-donLosOYOTqcm9JiQ@mail.gmail.com>
Subject: Re: [PATCH] loongarch: update config files
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, 
	WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 30, 2022 at 4:46 AM Huacai Chen <chenhuacai@kernel.org> wrote:
>
> On Thu, Sep 29, 2022 at 6:44 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > On Thu, Sep 29, 2022 at 12:42 PM Huacai Chen <chenhuacai@kernel.org> wrote:
> > >
> > > Hi, Lukas,
> > >
> > > Thank you for your patch, it is queued for loongarch-next, and may be
> > > squashed to another patch with your S-o-B if you have no objections.
> > >
> > > Huacai
> > >
> >
> > Feel free to squash as you see fit. I cannot recall sending something
> > specific for loongarch-next, though.
> Emmm, my meaning is squash your patch to mine and keep a S-o-B in that
> patch [1]. :)
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git/commit/?h=loongarch-next
>

Process-wise that seems a bit strange (i.e., just mixing S-o-B by
multiple people, how do you bisect which individual change broke
something [you would need a second manual step of investigation],
etc.), but sure go ahead.

No objections.

Lukas
