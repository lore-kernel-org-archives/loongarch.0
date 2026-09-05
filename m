Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3B535295C
	for <loongarch@lists.linux.dev>; Sat,  5 Sep 2026 15:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788620668; cv=none; b=IOW4RC3GGhVj3ELTnJHGs5Cp/OgOV0obevwdYTiTzRioAhUOX0gvNBxd3XIZpfMjSGN/I9EGshtHO+sWEhAprCxn+4n4/UcKwgQr1Z9am7rE+IxpS93PmZjxAzzrrLys4IOTip0VXhe9Pn8J9PcM5kJM790oJTGdtNWyl7zlmPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788620668; c=relaxed/simple;
	bh=YFjMe/YXAaNVfN26W2QVra+xlGRT25CaKbLEhWwNiBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aZ7CceFw//4zql8UWT5YMDJ94HZNL1jlqypEP/rUzrokRgkvWAxfgy63Ijc2nmYOELqzQVUo67a4vg4MglsjJlk2W6P99n3q569261X6hgAH/FwTSFgzAMHyZYvJhyAXmWw8Q9fS13+IrXhk1VPfsvbn6iboD7FlUKTHdDym1Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L1hjjRpZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L1hjjRpZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AD91F00ACA
	for <loongarch@lists.linux.dev>; Sat,  5 Sep 2026 15:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788620667;
	bh=PW6mYD5+bS0RmtKdaFREbvrZ4q2PG40hRCj1QvW9YEE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=L1hjjRpZuMOwgvPbLmUJ1hn+o+w+IMOk7DbBMof0vBVixngEKXGuRCGdoNJhpggt2
	 gw/dXQnTwVOlrbsCRXpVX16NEtC2hI6nQjd/0BFSVuQzAYSvbAZYj0vTBkB9rzUmzQ
	 w0rXXw4u3Y8znfEhkyUpsqOA2q4EE01txJP7hVvEbiV4JtW1SlG4bOBzVlQIC2VEyO
	 zGZnKxJu1qek5Vy9k57D9ctWj8hRZKMZO2Ucks1u6+U4i9OOMp+W1KqjwFlSOahsxZ
	 B3UeMCu8HJYLDpy/HTFsoEpClvT0REk5kdzM9ceOv6O+743PxMXe3UibZ03o6hBMEK
	 S/Gwf4kZ9eR4Q==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a5e392b2b3so3276411a12.1
        for <loongarch@lists.linux.dev>; Sat, 05 Sep 2026 08:04:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxj8X5/+uySbdnhHQPWn3rlR0vpagvZ+HYPR3VruZqHKO6zy3QOPfJsaf19/FC0KnOxFm/NoHG5SWA=@lists.linux.dev
X-Gm-Message-State: AFuF++kbeLoE12C6iDmYhS3srhMYh6KmH7G7bpVHZGI7msaRFZc9fIiT
	ZHskO7KUQZ6Xr9m49DYGTfoS0oI5K96uqfowkjHfePTh4mu8x19ZwDmLvDUERnxgKnhot7H/9Bx
	zvKiN4DfCSJ36mxCz9Jnvie4YO6Riilo=
X-Received: by 2002:a05:6402:2087:b0:6a6:15a1:6c38 with SMTP id
 4fb4d7f45d1cf-6a7e8d544admr4135849a12.3.1788620666239; Sat, 05 Sep 2026
 08:04:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904110807.19508-1-hemanth.selam@gmail.com>
In-Reply-To: <20260904110807.19508-1-hemanth.selam@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 5 Sep 2026 23:04:14 +0800
X-Gmail-Original-Message-ID: <CAAhV-H620i36YF0L3+AAOGycSeeTZXh6e9efa-Vmg0G6QH+msg@mail.gmail.com>
X-Gm-Features: AcwNN1XDBuU0rPFa6LBaMwf7chIXc_tV0ZgRrWb1yRXmUQdC0BLAptbDyySgT_A
Message-ID: <CAAhV-H620i36YF0L3+AAOGycSeeTZXh6e9efa-Vmg0G6QH+msg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: fix typo "avaliable" in comment
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: WANG Xuerui <kernel@xen0n.name>, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.


Huacai

On Fri, Sep 4, 2026 at 7:08=E2=80=AFPM Hemanth Selam <hemanth.selam@gmail.c=
om> wrote:
>
> Correct "avaliable" to "available", reported by scripts/checkpatch.pl usi=
ng
> the misspelling list in scripts/spelling.txt.  Only touches comments, no
> code changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  arch/loongarch/kernel/vmlinux.lds.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kernel/vmlinux.lds.S b/arch/loongarch/kernel/=
vmlinux.lds.S
> index 840d944c2f73..ce097e25881f 100644
> --- a/arch/loongarch/kernel/vmlinux.lds.S
> +++ b/arch/loongarch/kernel/vmlinux.lds.S
> @@ -23,7 +23,7 @@
>  #include "image-vars.h"
>
>  /*
> - * Max avaliable Page Size is 64K, so we set SectionAlignment
> + * Max available Page Size is 64K, so we set SectionAlignment
>   * field of EFI application to 64K.
>   */
>  PECOFF_FILE_ALIGN =3D 0x200;
> --
> 2.48.1
>
