Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3FF16DC3A
	for <loongarch@lists.linux.dev>; Fri, 12 Jul 2024 15:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720798294; cv=none; b=EARH7EpBnz/1Co0UnUNXWJHYJy3YU7XFkbh5qz4NQLKO5BUZNuqDv4d7tiPgLWpn/f8v6sEfnufGvB/vhLOkdCT7f9ISnoHfLZnSnfrCXHXP0nRN8gem3gkE73kzt1+A0etP8viec/qq5/JujO9omZexhyH63zNjcYYN4vvGlhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720798294; c=relaxed/simple;
	bh=yuUkgSUd6vmj6tHpzYFlSGQESGT/hX3N3hMolRd/53s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qWFn/zvjQ9ACV9TmTzIE4hsaMHr8zHUNcgZ0zzg1BwCbPvG/UjzGZ+ukd3g0f9Q5HIgvn1ZTpu4WF+b/MT/v7nbU4xvHDzBMYQix7nxNht/Wgw46mRDi1Ays3nX/1g7A8N3si44Ly+y8TMV7W07y64zCb/+45zIOwqgWa7wi7CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Paa2Feqz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Paa2Feqz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720798292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8pYjkzLgzHvy7cWc4vPkKfOHo7WvPjxKqpxHFA0Pgts=;
	b=Paa2FeqzxA2EqzOuFPMaY3gWS851nGGYdXeaXKLn8SFEyBVboxV7CyjEWOD8abQ+G773Vy
	+7xsgwdL51BrFYVZyRasPLGgSA8z2eMs0vkqDBdGnztTJKOfu5fbsSx2E59qHnpiJYzKXR
	4cMTFzGijtG99G202Rjgp5nk/SljGSU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-v_AHXq2-MpisRoINbD8WzQ-1; Fri, 12 Jul 2024 11:31:27 -0400
X-MC-Unique: v_AHXq2-MpisRoINbD8WzQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-42725ec6d8dso19731165e9.2
        for <loongarch@lists.linux.dev>; Fri, 12 Jul 2024 08:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720798286; x=1721403086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pYjkzLgzHvy7cWc4vPkKfOHo7WvPjxKqpxHFA0Pgts=;
        b=gSy95o83h85EylBWqKS+NzIYeaF4LN2vhFCr9v787JuUnaqqQJWO8bqn/280h+d22u
         sf0BRa3EU+NAhpCVGv4qF0XvlV+Xg3T1uRv1zIXU5P4aVWz9Mq2CNfRxWzcB8CFz8y+r
         GRFesuRvoRWLkJgHMwX98ZpFkiucqfSSnqCJhQWBex8LT/2Zc7uVJQqD/3Y47uc7IyAc
         mMU3QKIuJKmgP0puvxlflqnmZOWjSANpDoxKaqN3eaU6AJa1fy10A7gRLuyOhqYfrDvq
         6WRbOnfpNvaNSu4CjwX/cH1y0mvO75dp9OqCaqw2ITvtqt+QyNHQ6VKjBFXdswP+ARVm
         9GUg==
X-Forwarded-Encrypted: i=1; AJvYcCWrxzNbJc1ZTGQ7YorohoYKXnf3+XsnAJJ5cJJIenL+C6wcdisLEQDPLYrolVLsriDEE91KTSk1I4fpb2nFnYhEOMQCnC5P1nGI
X-Gm-Message-State: AOJu0YzJOi7BRgGmJb4FaWKEmRH3yzzQsz/rK3o4Fm5ftpIqCn9VCsK+
	U/ByqCI6FBySpEp6B004WA3XsHIppITX6TfGOipEVaTdMhAFnAL67N+5L4SQ6zP07LGQMDFklgi
	Vr/1osQmvrmA4zh9NP4qZ7AX+C0dbSJ3YFZW266xyPl9gHh2Cy/V84XQ0KMjXNoWVGGcjt/CnUF
	OKFXTSOCSa8/RZxJl1euBZVT8DBbxfRvAB
X-Received: by 2002:a05:600c:47c7:b0:426:6ed5:fcb with SMTP id 5b1f17b1804b1-426706c62c0mr103472115e9.4.1720798286752;
        Fri, 12 Jul 2024 08:31:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpwU6rx2/rdjP1qBUZaPIgntGNbKwFTW7FjwPn5/uO82kUiFkIG1Brg/z5ZHfnsc9cT0EpUfc5/AnoXthMn3k=
X-Received: by 2002:a05:600c:47c7:b0:426:6ed5:fcb with SMTP id
 5b1f17b1804b1-426706c62c0mr103471885e9.4.1720798286392; Fri, 12 Jul 2024
 08:31:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240710104923.2569660-1-chenhuacai@loongson.cn>
In-Reply-To: <20240710104923.2569660-1-chenhuacai@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 12 Jul 2024 17:31:15 +0200
Message-ID: <CABgObfZd1ugY4cFygnvFtiO9p3iE1GA3Wn7Avdkajz_9iXVNTQ@mail.gmail.com>
Subject: Re: [GIT PULL] LoongArch KVM changes for v6.11
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 12:58=E2=80=AFPM Huacai Chen <chenhuacai@loongson.c=
n> wrote:
>
> The following changes since commit 256abd8e550ce977b728be79a74e1729438b49=
48:
>
>   Linux 6.10-rc7 (2024-07-07 14:23:46 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson=
.git tags/loongarch-kvm-6.11
>
> for you to fetch changes up to 492ac37fa38faf520b5beae44c930063265ee183:
>
>   perf kvm: Add kvm-stat for loongarch64 (2024-07-10 16:50:27 +0800)
>
> ----------------------------------------------------------------
> LoongArch KVM changes for v6.11
>
> 1. Add ParaVirt steal time support.
> 2. Add some VM migration enhancement.
> 3. Add perf kvm-stat support for loongarch.
>
> ----------------------------------------------------------------

Pulled, thanks.

Paolo

