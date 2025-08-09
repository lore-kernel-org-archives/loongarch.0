Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35E6AD51
	for <loongarch@lists.linux.dev>; Sat,  9 Aug 2025 03:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754711303; cv=none; b=DbG5lNXZWnw0oSf4uTirPzPjsC2uxUb1Su24xTnfnjyrt+3XqI1rBkrYwMplLyYibnhFbag90NCxBByYbHAg7Oi6LKHO+ElqAjGlX5gFJVpTiAzRV0OeJhFkVetUrGEyGDBSoHJseEYFoPKssh1c0XxRPketgSkA0X1ManzFr+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754711303; c=relaxed/simple;
	bh=LUHN7UPLAjCxzVHX7/GMQQ5Ox0/CqPZVW05hi6VANp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ChfXLBHGKK3/Tr855W0wuksucDz/Gk6dO/BfWYAG4yNjPBoSEdmZH2sLStgM/kvl3e2ewOPlx3PnFzUOkTUfKkYugXTZIzFii1wKv1MgkE+6v2GAp5k7u90FlGFHrJb77Fb948Azx+yixkYcLlfZUOKR6gMc1j/0w8/dgdjjFQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UrkOllBA; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UrkOllBA"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4af123c6fc4so27283361cf.0
        for <loongarch@lists.linux.dev>; Fri, 08 Aug 2025 20:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754711299; x=1755316099; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUHN7UPLAjCxzVHX7/GMQQ5Ox0/CqPZVW05hi6VANp4=;
        b=UrkOllBAPu4hnwQ6zMuTB3FiKh4Bi6H7nAPBdHYkfExHEqEUdf1c/KjJNBdu0CqMin
         5gEgxAs25fEYQrLk59o2j59MtwoAzTVrvYZavSxfb6DERJlLd1q9hzmPocikAUgu3vHT
         82XOyHTp1BTfzJQzMg4EPIWvzGekgQpp3rTpkibynYUz89QYRmqd21oZgZZBPJxFfToj
         slursAS7khH58oX7cXndgVd2yRlH2qVtnBZjdPiqiwITmq2mSnOQhiHt/E0ismod4Chi
         nbtHk99lqLP3VGUGWiPSGBlK8fSdRyRiESU2DnVasIQ/jaeSAcMuqNG6XdjBQ8s5VQlo
         ic8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754711299; x=1755316099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUHN7UPLAjCxzVHX7/GMQQ5Ox0/CqPZVW05hi6VANp4=;
        b=WNU6TCQqeNNFdA5RYMFj3PQLUayiSkcr3hyUsXh80IqAln++KXy5aBaJqPr2/xvfsb
         EJeGUZ6HR3LcFhxG+yQMr8wxqMgGMm67wriPanbPP3TnQkULjbqI+1byt4LiJtfk6vZD
         C9TswxFqv4Bg73KtTkJRKeWd6C5CjafefmgMarcC5XjQDW+97ox2eD47p0zLFu99eiuM
         mxtfzJFDqDMydkyEGxPzoMtkdESOFGEwHGzozl7wkj28/1cb9uOUyCZnczvt4Al9IV2e
         q0jFSR1NIx8sFDOcqtK0EQQBSzLyRtaMoX7Lppa5WpG+a60LJEojCdPj073GfxYDPxXa
         KlIg==
X-Gm-Message-State: AOJu0Yx3Hs/Gu+Z9SZjV/gQq+Q74PqUz8OUx6wMW0EMG0YBymo8TVgT0
	zkjoed49mDVSp/BqowOPypgnTjfFF1r0jc5oB8IjWpjsToS3uGZbRHpTSoSQuUQ+n1ckvCO8hR/
	z5mzdT5XMzbzQGKLZe+hcCx1E8RDpLBw=
X-Gm-Gg: ASbGncv0fzhV6ex7ZGbpORophuQd1K8lKmoTvYLrUpKSZ/xTTh0WYrlkruUUT5CsG/x
	MmUtTADx0ynUziOuxD7uA/+bDxCJtq3Hw/y7iziempDTTd8Xr5bGUKjpPs0WpXKHRkR7iWvtlhD
	xWfBc8apEyNQjOB6VUtAOzoHU7qt+dk2R9xZy8yL6hAFRjBOT0XXfYHFW+JoDuhBiywH+ue5L1m
	bec0wM=
X-Google-Smtp-Source: AGHT+IFfxr4KQtXnxBq7DqwrXUj/8Fi2Ej0ntsSzbU0kx87ueUxb2wJYmgoUbOHp19inxmgizpsd8OZKtibZWBuzC9k=
X-Received: by 2002:a05:622a:408d:b0:4ab:3fda:ccad with SMTP id
 d75a77b69052e-4b0aec5dad8mr67191901cf.8.1754711298590; Fri, 08 Aug 2025
 20:48:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK3+h2x_N-UnQqz_=bQOK9vB8fxEU=4YQ3YwCpnMNW4i5uBkQg@mail.gmail.com>
 <CAAhV-H7wOZUJfn4pP2bV0G8Hnt2AfXt1ZL-eY5FFnQs4XF8g8Q@mail.gmail.com>
In-Reply-To: <CAAhV-H7wOZUJfn4pP2bV0G8Hnt2AfXt1ZL-eY5FFnQs4XF8g8Q@mail.gmail.com>
From: Vincent Li <vincent.mc.li@gmail.com>
Date: Fri, 8 Aug 2025 20:48:07 -0700
X-Gm-Features: Ac12FXzupgRUVxMQ61lRRwglIKh6JHhoYx5_60JO7Udbufzrf2-x0YH4tCVidjY
Message-ID: <CAK3+h2y003+3Ts+5PjVaxhYc8KM74B+3mSJ-hCt+Gmmta8Rbww@mail.gmail.com>
Subject: Re: kernel lockup on bpf selftests module_attach
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev, Hengqi Chen <hengqi.chen@gmail.com>, 
	Chenghao Duan <duanchenghao@kylinos.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 8, 2025 at 8:03=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org> =
wrote:
>
> Hi, Vincent,
>
> On Sat, Aug 9, 2025 at 12:53=E2=80=AFAM Vincent Li <vincent.mc.li@gmail.c=
om> wrote:
> >
> > Hi Folks,
> >
> > Hengqi mentioned offline that the loongarch kernel locked up when
> > running full bpf selftests, so I went ahead and ran make run_tests to
> > perform full bpf selftest, I observed lockup too. It appears the
> > lockup happens when running module_attach test which includes testing
> > on fentry so this could be related to the trampoline patch series. for
> > example, if I just run ./test_progs -t module_attach, the kernel
> > lockup immediately.
> Is this a regression caused by the latest trampoline patches? Or in
> another word, Does vanilla 6.16 has this problem?
>

I suspect this is caused by the latest trampoline patches because the
module_attach is to test the fentry feature for kernel module
functions, I believe Changhao and I only tested the fentry feature for
non-module kernel functions. I can try kernel without the trampoline
patches and will let you know the result.

> Huacai
>
> >
> > A side note, if I put the module_attach test in
> > tools/testing/selftests/bpf/DENYLIST to skip the module_attach test,
> > the module_attach test is not skipped.
> >
> > Thanks
> >
> > Vincent
