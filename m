Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E0337C926
	for <loongarch@lists.linux.dev>; Sun,  2 Aug 2026 12:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785672128; cv=none; b=hzRUw/2g1HYNNKl3vcMcUZeUP14W/S3L3ZtvACeESyhcU7SRT53yc85W8NFmjDq8rYbrNlWnP+Ev/Che4WW/r+IrArj6QdG35+4urb+9EER21AiIa1wd67npYyeo92tkdJmdFZViVYIqSV+Zno0JXsaeSOvx3yMM7JeS+3X+nh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785672128; c=relaxed/simple;
	bh=20OVG5ErC74HkkynhRenCb5S/w+tVliz6zl+6H0LziE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e7EWWdyzR7obHXHGaU/3vDu66r9OkVgGpCWIpXfk+Koxpb5AfuAynMxeF3E6Qxa/FyXNhfXzEDfLY9O3tq5KlLHhFDFpG31Hs7jvZjybLrlAmSGT+diV1M3DsxgDFZdAtRsv7Lu81AVNapNaLQkeltD+GjNM4JMs8L1RGf2wYks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jcb3NB3q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jcb3NB3q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AF571F00ADB
	for <loongarch@lists.linux.dev>; Sun,  2 Aug 2026 12:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785672125;
	bh=hG+6Cf31gLh5W2uTxuxW/+rY4a9XbZb2q/SCpe0oMgc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Jcb3NB3quz5AZXM3/mjuw4m8MEQpYjFfexNrOzVqrtfEB19+Wf4buOaQI95VyeiPW
	 aQ7AQ+RqnoCdO/fkLnwrPQ8gb2sSH3JWZtYCky9FZjkTNB59VuwWM06ZIX+Le/gnG9
	 s/Dh9Y+EHN4nUyI3DXNB7H3fjsa5rrX4Vr++5Eq//CLPB7f0MbHUrq+ywqYs6IK2d1
	 TkFl5iW4fC1jWX/FDqkiV9KsN5BC8YmnSg6bjH8PcTlDZFvp3lTU8HFsfynRDkovDC
	 qpCz70fZC5vefzLPofW4qkPQdtAnp745hbNcXSHD1Q6ocoYPSVLIAj0cQn9BuFLYNj
	 QpIjIvRQEDCaA==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-69fc2261f2bso4186032a12.3
        for <loongarch@lists.linux.dev>; Sun, 02 Aug 2026 05:02:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoDCOQKzaywpbHjzs9v8OTkrY5ZzH9ffaw/QzHbtgqTatQpWCEvq2ozw1aUM2BSK2hTQV7lpRQ09/A=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXo2/3UJqEj/4NbjhzNi//Y5l/X99PtaT5bqRz40Q8EFJBhH2K
	ve8B0QzZx2/Z0UTlnL0drLVasnQxrbYYlIErt+hIK6Nm+LjqRlHIMkvXfoco2J5SxoaYa4W0kZI
	fOF/yWOJzTSBTeRRQkuhatWs2SXqmVdE=
X-Received: by 2002:a05:6402:3250:b0:6a0:eb:ae41 with SMTP id
 4fb4d7f45d1cf-6a0a7c850ffmr3328472a12.10.1785672124284; Sun, 02 Aug 2026
 05:02:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715100640.1454413-1-cui.tao@linux.dev>
In-Reply-To: <20260715100640.1454413-1-cui.tao@linux.dev>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 2 Aug 2026 20:01:53 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7NArGzQJX-h9U5Wr5JjkKoTAc=4Ug6z9FeR5yDy6PSTA@mail.gmail.com>
X-Gm-Features: AUfX_mw4We0MyYo-vIPcV8d8ksM5N3MkaFbWWCQgB2Ilg1yNIOy3V3f2MIHYSZ8
Message-ID: <CAAhV-H7NArGzQJX-h9U5Wr5JjkKoTAc=4Ug6z9FeR5yDy6PSTA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] LoongArch: KVM: Fix timer restore issues
To: Tao Cui <cui.tao@linux.dev>
Cc: zhaotianrui@loongson.cn, maobibo@loongson.cn, kernel@xen0n.name, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	lixianglai@loongson.cn, cuitao@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Series applied, thanks.

Huacai

On Wed, Jul 15, 2026 at 6:07=E2=80=AFPM Tao Cui <cui.tao@linux.dev> wrote:
>
> From: Tao Cui <cuitao@kylinos.cn>
>
> Fix two issues in kvm_restore_timer():
>
> Patch 1 fixes a one-shot timer firing immediately after migration because
> vcpu->arch.expire is not migrated.
>
> Patch 2 fixes a division-by-zero crash when a guest programs a periodic
> timer with a period value of zero.
>
> Both are in the same function (kvm_restore_timer) and are sent as a
> series for convenience.
>
> Tao Cui (2):
>   LoongArch: KVM: Reload one-shot TVAL on migration destination
>   LoongArch: KVM: Prevent division by zero in periodic timer restore
>
>  arch/loongarch/kvm/timer.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> ---
> Changes in v3:
> - Add patch 2 (division by zero fix, found by Sashiko AI review).
> - Reuse the existing now timestamp instead of a redundant ktime_get().
>
> Changes in v2:
> - Move the expire check before ktime_before() (suggested by Bibo Mao)
> - Remove the old else-if branch that was one-shot only.
> --
> 2.43.0
>
