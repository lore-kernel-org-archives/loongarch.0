Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BC74776A
	for <loongarch@lists.linux.dev>; Mon, 24 Jun 2024 12:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719232100; cv=none; b=Mlqfzk+V7PdW1ebJkhFxjw/02o9ZmXyr7+xUdi18jgkPyTy3KRo7MhFhO2YZCmy7VIp/d0Nt2tZzuMP0wgK7ssFvYQiu5T6wB442W+7ItKlwm8Aq5qwBkE6icT06nvis2vDIYuCzwvprFBduk8k+U50b+SbqefuuZAfKQpL6mXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719232100; c=relaxed/simple;
	bh=vDRm043puDoGOMdb6yxVqyoLpLEK0Mr7K2kShYPQA4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MCXoY63wg7y4yJJsRCo3nO+0VB4UyrPdOVTYy+c25U2YkkKKijYULvW62JBVooFH2anB6L11foNIMhhKRRKz98ln1oNjxqySHotqds4H/6ulw3/uCH2LIigaoYvh7C8tjhEecSPeqPi7zy0Lk73Ql0X5heJ9d+mAmwlhaCsG1+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YHMDAzxU; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YHMDAzxU"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a72477a60fbso139763266b.2
        for <loongarch@lists.linux.dev>; Mon, 24 Jun 2024 05:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719232097; x=1719836897; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHJsxhxdOLaqizliJLOPpaKHXoqhdyk0yF3LIbtNF28=;
        b=YHMDAzxUy9oA7fE8lPtWkmdFWQLNlRcyYbCdgE7TVBAAtOwDKprFeCZyZjydP8CBBM
         WfZlX9MG8Bwqhs5xG4DEJSNLq1BozwrEs4j1oBD1EaIaeZ0gNiFKLUzwZ8A2yC/QSYcW
         wSGd/c4nwu3RqdVWV+bt2H4OrJdtGd3xMCL/xFcfVXHolKjNmRwnE4xfARhV794wXBh/
         6lPr1VHuChfeF9yPEAa2/ni0BJhURBi5/NFdcqPARqgr88o8LpVoX/bSIqjIOk32bXoh
         9RDenSRzUJyvPe/9iaFX1ySa+cZX+a5HfwB37d4t97sSZ7PRvYsf59fj5Cki38TluDF9
         hBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719232097; x=1719836897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHJsxhxdOLaqizliJLOPpaKHXoqhdyk0yF3LIbtNF28=;
        b=p4zwme+kKlTK7uXjhdwfuyMxbVhDWjjVsfpjl1Hz2BtwJoTqJgGcLVqAlq7RgVIiDq
         0ufITRbEDWITJ5KXV1dE1GWrK4XpxYLoePVMUWG8vzJMoIvriykzWpbFewOA4badSn1/
         6n9+1muwG9Q7u/G0ztdAeorXed9xfV3s/szUc38gaZouUk8mYSOyxszwjubfxbv9ylTg
         yWQjtwDCWYLFwwTYLJqqbeVs8EHLpssFw7bjsn/JnDIkG4nxm41wygppjLlw9AUBB6D2
         ZWUcg9DYTsi/Cj1autl7dcVmhs5SVUwko/NeO7AGjaz3XZ4wjtv39awiEOWyaAUfvHeX
         3xDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCUHVrINjWSMdnKLsewuwE2svDaesjozQw/lZROD4GjpKiyhnEu5u023mQnTdl4Pw+4IYl+SjDyN7bItTt9O6gTSeBRPsXgP1K
X-Gm-Message-State: AOJu0YyymI+aWGA08h7B/mRBnTvwgcIOzoJ2gQBZjtUg03Q3fnpQ2dUy
	DGB4PZjM+Xg3HsktFBZ81qIWs3Pnq2hxjq/c2IPE8MZrxFhT6x+rYz6JqlOoXxcDkBxZKbsvLvI
	I3ZdYPE2wHetVBDjVdZcoCud6b1o0edit
X-Google-Smtp-Source: AGHT+IFLuihGCVppoutdyi8cBVHlab+e+O4qV5jLbe5dJIxrWHY4mdjCw71NzObZvquv4leyc73TcWAQqFe10tnNgqU=
X-Received: by 2002:a17:907:c5c7:b0:a72:52a6:a06b with SMTP id
 a640c23a62f3a-a7252a6a114mr194276366b.46.1719232096844; Mon, 24 Jun 2024
 05:28:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240624085037.33442-2-xry111@xry111.site> <e2lv3qamggymdjqzujvyhsd2q34jy5tryniac7d446tlaebqwy@5x4zn7z4d3xz>
 <b635271e73b35487a06cf17176243e6ce4cfcd58.camel@xry111.site>
In-Reply-To: <b635271e73b35487a06cf17176243e6ce4cfcd58.camel@xry111.site>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Mon, 24 Jun 2024 14:28:03 +0200
Message-ID: <CAGudoHFQ1SnKubuDsSxE39W+MR6Af2PbHkrNwAAbZFb-9ETswQ@mail.gmail.com>
Subject: Re: [PATCH v2] vfs: Shortcut AT_EMPTY_PATH early for statx, and add
 AT_NO_PATH for statx and fstatat
To: Xi Ruoyao <xry111@xry111.site>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Alejandro Colomar <alx@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@loongson.cn>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Icenowy Zheng <uwu@icenowy.me>, linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 2:19=E2=80=AFPM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> On Mon, 2024-06-24 at 11:04 +0200, Mateusz Guzik wrote:
> > Below is a diff which compiles but is untested. It adds AT_EMPTY_PATH +
> > NULL as suggsted by Linus, but it can be adjusted for AT_NO_PATH (which
> > would be my preffered option, or better yet not do that and add fstatx)=
.
> >
> > It does not do the hack to 0-check if a pointer was passed along with
> > AT_EMPTY_PATH but that again is an easy addition.
> >
> > Feel free to take without attribution:
>
> I'd still like to make it Co-developed-by: or just From: you.  Could you
> give a S-o-b?
>

I just trivially shuffled some things around and did not even test, so
I'm not signing off on squat here. :)

However, if you insist you can add something like "Written after
picking up an initial patch written by Mateusz Guzik, see [link goes
here]" or similar.

> And with this change AT_FDCWD with AT_EMPTY_PATH and NULL path does not
> work.  For consistency it'd be better to make it work too:
>

Good catch, I have no opinion which way to fix it.

--=20
Mateusz Guzik <mjguzik gmail.com>
