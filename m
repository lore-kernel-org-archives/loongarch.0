Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E0E2560
	for <loongarch@lists.linux.dev>; Wed,  8 Feb 2023 11:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6481C433EF
	for <loongarch@lists.linux.dev>; Wed,  8 Feb 2023 11:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675855129;
	bh=FB6keAUU2iV82Db3Z/QvDU9fBWXLtdlQlGrnK51CGRA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EZNL/T4CFFXiqumqdnuerJRZckU9tRDooP/G+CIVv9jwF6gYQW+Bb//hRhm+YzPMm
	 iUwZUtiTGF178DksyC81wsCcyIrHwyYctbalkXJwzZLgh7K23CpAVgBoMoCrNw7mUu
	 UF9EjHqLeLgBC4fv6Ye5UDK9bTeUtgJyBc37tzvJBhedCcVaBCtDpmhMDfN2H7DwdN
	 D1dmxpUlIWuYdhIJCqd5GQ0Pq3LXi9IyeWSTjyEnqwzwZ4jzoSwYYzkT2jFVlik1/U
	 rjbVcnc7Bms2vD8JVLKpZV3/C6qFJDbaZtF7IjnjWnhIjdHVoXyprWuGv0LDrbXmRA
	 UAxNTKQXUOHmQ==
Received: by mail-ed1-f48.google.com with SMTP id l12so11059135edb.0
        for <loongarch@lists.linux.dev>; Wed, 08 Feb 2023 03:18:49 -0800 (PST)
X-Gm-Message-State: AO0yUKUQihBAfbDtg8A5NjFu5HKaNOOe8+ir6Xf9W6iVyjlFUrpF0ci5
	6z5y2DmbJ6eBbdpNLXkYEqy3OcM7HRy9koMjg8A=
X-Google-Smtp-Source: AK7set8wupXZ9PQj64buVeyjZlIW9gSV8SkLGy8vbWlz4OvAMbiVKbHJZ70l+rnbPYxbm4axFkrAqWgUeJaB3ouo1kY=
X-Received: by 2002:a50:a40d:0:b0:4aa:a503:53ed with SMTP id
 u13-20020a50a40d000000b004aaa50353edmr1547217edb.7.1675855128002; Wed, 08 Feb
 2023 03:18:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230202084238.2408516-1-chenhuacai@loongson.cn>
 <363cd09a5dcb4deab21f58c19025254f@AcuMS.aculab.com> <CAAhV-H7Mz1Z5Bo59tq5VRSUx-N39axeiG7xZs2Szn6nuOxgZfQ@mail.gmail.com>
 <9936da8f577842b8b5edafcdc69dc2d1@AcuMS.aculab.com> <560d73a8-2f2a-4844-44ff-afffad9c8694@loongson.cn>
 <379bcb55-f75d-02ce-a51b-467e21ade5a3@xen0n.name> <dcd17646-4b8d-447b-bd85-c66c4a7b2cf4@app.fastmail.com>
 <924aa802-410d-a85c-b623-7ca30d15c637@loongson.cn> <59745bb8-00d0-4fa3-b75c-511db310ac16@app.fastmail.com>
In-Reply-To: <59745bb8-00d0-4fa3-b75c-511db310ac16@app.fastmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 8 Feb 2023 19:17:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7X_T7t88TbEZfkrwUcDAoJy1X4KbzWw_KZaoXuq730RA@mail.gmail.com>
Message-ID: <CAAhV-H7X_T7t88TbEZfkrwUcDAoJy1X4KbzWw_KZaoXuq730RA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Make -mstrict-align be configurable
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jianmin Lv <lvjianmin@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, 
	David Laight <David.Laight@aculab.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Linux-Arch <linux-arch@vger.kernel.org>, 
	Xuefeng Li <lixuefeng@loongson.cn>, guoren <guoren@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Arnd,

On Tue, Feb 7, 2023 at 10:11 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Feb 7, 2023, at 14:28, Jianmin Lv wrote:
> > On 2023/2/7 =E4=B8=8B=E5=8D=886:32, Arnd Bergmann wrote:
> >> I agree the default should always be to have a kernel that works on
> >> every machine that has been produced, but this also depends on which
> >> models specifically lack the unaligned access. If it's just about
> >> pre-production silicon that is now all but scrapped, things are differ=
ent
> >> from a situation where users may actually use them for normal workload=
s.
> >>
> >> Is there an overview of the available loongarch CPU cores that have
> >> been produced so far, and which ones support unaligned access?
> >
> > So far, produced CPUs based LoongArch include 3A5000, 3B5000, 3C5000L,
> > 3C5000, 2K2000, 2K1000LA and 2K0500, where 2K1000LA and 2K0500 are
> > unaligned-access-unsupported, and others are unaligned-access-supported=
.
>
> Ok, so these are actually some of the newer (though low-end)
> implementations that require the workaround, not the older chips.
>
> In this case, I think both the kernel and toolchain need to default
> to -mstrict-align, unless someone specifically asks for the variant
> that can support unaligned access. The kernel option could be
> guarded by 'depends on EXPERT' to ensure that this is not set by
> default.
>
> To be sure that this is set correctly, the
> arch/loongarch/kernel/unaligned.c file should also never be included
> when EFFICIENT_UNALIGNED_ACCESS is set, to ensure that any attempt
> to run such a non-portable kernel on 2K1000LA results in a
> a kernel panic rather than silently fixing up the unaligned accesses
> at a huge performance cost.
OK, sounds reasonable, I will send V2 for that.

Huacai
>
>     Arnd
>
