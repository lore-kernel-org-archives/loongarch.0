Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3E01DFCE
	for <loongarch@lists.linux.dev>; Tue, 26 Aug 2025 02:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756176186; cv=none; b=dqZsHfZ/e8CFXaN1kB9p8xD39fc9iWKM9u+tgyBfdX3WdTS0l0xXoJYppXprUnAx4QQkbSFVQ7TnxQPnxYjTKeryjkMjAWs6oJYAMAkJJ0a9lNN+mz1qYY+B51BY5wnItSktkWGToRZU755JK41HxI4McL/KDtIioeWNy7alVMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756176186; c=relaxed/simple;
	bh=1zDaGs/kld2uTzaCMclVfOGPgjO6KdKJRsGrRbmQ8E8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t4Vf9sxNXbFNs0rAv+uiQpmMda7QXs4IzLqOu/6z6jxNcTW9PROdxLixD9U8lIy0+EknDP5tXcwHMVA9PBa+DNUgNn5YdkD+PUYJMmmrLhfbXzzQnRQRJzEIrHBtrWrTfLLaFPMSPjoUDUl0N8ISMypOexQepjp1SQiHZksQJvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O2BJeiOA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O2BJeiOA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704AEC4CEF1
	for <loongarch@lists.linux.dev>; Tue, 26 Aug 2025 02:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756176186;
	bh=1zDaGs/kld2uTzaCMclVfOGPgjO6KdKJRsGrRbmQ8E8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O2BJeiOARaSX85Eu4LAKke2b4qea2jb9uSRulr5o7pYBqY3xuI4vFfTNjXa3IwUFl
	 lmTdVG2Gduwh3TI7oTAX6we/c8qXeDxfwuDxI+sHyUmr/0otlsiM33r0IFrJsnFC6s
	 zLpcBQmtWb9JRdZS5yZqwjBYFOmkta+KC1U1JACboo/BxFJrQOZTL8H+IlEzwNFOUT
	 6iJ5Xwfe/M9Nitj+7jAPLtg8DZKmYjkmKiOdcCmZLK6U4brTYIzeY3QAT/o+X3O5Fr
	 cDstThcSuRHycFDxSzolkRHhwKq49yh/72N/2a8L512aVhk3M9iyvG9xRiMjOhaXCn
	 oIUoOiz+eR+lg==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb78f5df4so864356066b.1
        for <loongarch@lists.linux.dev>; Mon, 25 Aug 2025 19:43:06 -0700 (PDT)
X-Gm-Message-State: AOJu0YzOlVa+8FdlEjAKVb8YRiWGcMmQ/ocmC5AbIu8ou1gFzWU/z8lj
	u0pI+ZnVWfqJiY2yvbRZEe4Y+HMWn/FZAeTBJRpwoYopLa6WdTCmRyAF3FpucO0ftKsqilRk5+k
	WQgw7uhWPSJNzuqDpo0AuhIaaf0RgcD8=
X-Google-Smtp-Source: AGHT+IELGBSyn4V3YUSxBGtgNqVVtTLJrlf9PVG5+RizB7KX2mtoSIrTmH5IxGkcvleBYBDU5dVxI9I6kY5sBsZO1L4=
X-Received: by 2002:a17:907:6e92:b0:afd:d9e8:47b with SMTP id
 a640c23a62f3a-afe296e50d5mr1063421366b.64.1756176184988; Mon, 25 Aug 2025
 19:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250805110754.3243432-1-chenhuacai@loongson.cn> <175615793761.2150029.12607347712708724677.b4-ty@kernel.org>
In-Reply-To: <175615793761.2150029.12607347712708724677.b4-ty@kernel.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 26 Aug 2025 10:42:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4eDRUBFyn8Wny1o7uFHHWKF__Vtu+m0bhmUP2rFHkZ+w@mail.gmail.com>
X-Gm-Features: Ac12FXwj1ylAMykS5rHMW9mw_TXtIO885LHS0_iY9W1N6CdaauP6rPhPTYU5hnI
Message-ID: <CAAhV-H4eDRUBFyn8Wny1o7uFHHWKF__Vtu+m0bhmUP2rFHkZ+w@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Rename GCC_PLUGIN_STACKLEAK to KSTACK_ERASE
To: Kees Cook <kees@kernel.org>
Cc: loongarch@lists.linux.dev, Xuefeng Li <lixuefeng@loongson.cn>, 
	Guo Ren <guoren@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 5:39=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Tue, 05 Aug 2025 19:07:54 +0800, Huacai Chen wrote:
> > Commit 57fbad15c2eee772 ("stackleak: Rename STACKLEAK to KSTACK_ERASE")
> > misses the stackframe.h part for LoongArch, so fix it.
> >
> >
>
> Applied to for-linus/hardening, thanks!
>
> [1/1] LoongArch: Rename GCC_PLUGIN_STACKLEAK to KSTACK_ERASE
>       https://git.kernel.org/kees/c/351b51dc16a9
Unnecessary, it is already in 6.17-rc3 via loongarch tree, thanks.

Huacai

>
> Take care,
>
> --
> Kees Cook
>
>
