Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95D779DE
	for <loongarch@lists.linux.dev>; Fri, 31 Mar 2023 15:58:44 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id c18so21619506ple.11
        for <loongarch@lists.linux.dev>; Fri, 31 Mar 2023 08:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680278324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxJeRCNlob7RdsmYmplWDSRv896kgREUT/PanUMpg+I=;
        b=df94nsGP/LSbkeu4EwTcd6OWf4bwFCVeTX2AV6GGuJjRqHHCAMue+ucZDrKHUhmKYG
         rF1GcVAwowFS+Lw4R2ZOUyVGlohHcI6cjfHM7qK93vDDAl7K4QkmPtop0JyXgqtHXc7H
         /5vLStTMRgLSeUXBayN0bKd/AONKgI/U1KUKS5/OQNcRAufgEZpwDgrUSWGMu6Y857ge
         adjCqeJIwjNQ9e0ozCbwL/KW0l7dQvZWabnDNyAgsHKLIX9dRbhWd87DZu9ExUYc0qUd
         3JnEV11La2lDBJeuBzAsXlD+zwvLmegtNhi0v+YBndpY86p8Vd75hORyoRDkG0cpykNS
         EsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680278324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxJeRCNlob7RdsmYmplWDSRv896kgREUT/PanUMpg+I=;
        b=OS4aWt1cJZIagDsrxudKWHKTuS2CnFKv1JmU2Z3iRKZMEHxhknzxhFkc1iwYHQXFtA
         Zl9NpdHoWi+DJBWARkhH3yK9JBN0LgUuMmuFD8fY9dSJ/BiwsiTuGvAaLJcRkrueQHzF
         nhaC+MhRhS6QHAU6dLLtvV0tNLPzesKlxVzBDIv+m80JAct21XyYUrGFZd5jScWFkpRB
         LNS2yHEy67+l+1iuI1ADQvtVRChO1Ax0iGfxDPVyqhBd82BUSUciWyZ9z+8Tt0S9X9q1
         e4RMrl7OAYUcNsCqPyRKX7yuB+sczysR6zlM9LME04kEtT3dtec1h/g8498EaEyXfwtf
         Llbg==
X-Gm-Message-State: AAQBX9e0L1k6OfcEjUZTlhe+S2wPnKzl7PnU8P9xBPqyI3WuZ3Sz8PMB
	g2yODPpOs1CbFNtrJIsdhNJAjdrmSOZn2H6Hltk=
X-Google-Smtp-Source: AKy350bz/tztNwieqBPr0YpIGhRToLQzKICehLEvyBJaRV3QsLjS5DSIpsQJaRhwDGwOw8j+ci7/+u06sPwz0OatqIU=
X-Received: by 2002:a17:902:b48e:b0:1a1:dfd6:b0f0 with SMTP id
 y14-20020a170902b48e00b001a1dfd6b0f0mr9675817plr.11.1680278324230; Fri, 31
 Mar 2023 08:58:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230328111714.2056-1-zhangqing@loongson.cn> <CA+fCnZevgYh7CzJ9gOWJ80SwY4Y9w8UO2ZiFAXEnAhQhFgrffA@mail.gmail.com>
 <dccfbff3-7bad-de33-4d96-248bdff44a8b@loongson.cn> <CA+fCnZddt50+10SZ+hZRKBudsmMF0W9XpsDG6=58p1ot62LjXQ@mail.gmail.com>
 <2360000f-7292-9da8-d6b5-94b125c5f2b0@loongson.cn>
In-Reply-To: <2360000f-7292-9da8-d6b5-94b125c5f2b0@loongson.cn>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 31 Mar 2023 17:58:33 +0200
Message-ID: <CA+fCnZfoTszdoy7o_EfPXOc4QYo_Jgw9Qf0ua2JoNp0PXdrTPA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Add kernel address sanitizer support
To: Qing Zhang <zhangqing@loongson.cn>
Cc: Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, kasan-dev@googlegroups.com, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 6:32=E2=80=AFAM Qing Zhang <zhangqing@loongson.cn> =
wrote:
>
> > I get that, but you already added a special case for
> > __HAVE_ARCH_SHADOW_MAP to addr_has_metadata, so you can just call it?
> >
> ok, all the changes are going to be in v2.

Could you also please put changes to the common KASAN code into a
separate patch/patches? This will simplify any potential backporting
of common KASAN code changes in the future.

Thanks!
