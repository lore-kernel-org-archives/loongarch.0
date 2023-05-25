Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1887168D3
	for <loongarch@lists.linux.dev>; Thu, 25 May 2023 17:00:35 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-ba81031424dso1165558276.2
        for <loongarch@lists.linux.dev>; Thu, 25 May 2023 10:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685034035; x=1687626035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHrTsqL0nqeqxBvVw7n3mE3d9UFJpL2j8If6jZFByTc=;
        b=VEXX4D+/ehgygAWm5BmRxKMQVayX+huiD86BmHpUJbQZIavyZk8MqgFgBVJCgltW8G
         DGf1XLm8HhYD7C5Ltu5hncRV4xkFiRLvjnKAKUZAVqhHyZU7uDae6IK3C5qSD3GFgpGy
         OqLSmV63QlFHc9BLqOH+z3/46t/qsNvryv2gOmzRQJTarAzeFF3wkmaawd/u1vYzudf+
         2OoFyE7ArYkSpPwfiPG4wUCBT5egkmxxlXwXAVhzZYomT8xAIzGjfTrChNVAlbK2FaKO
         3t03QrSsNM3MzVGbAgb9jEqdKkZ/GGbY36ZIzPCKupNWpFQuCEQc+t41/FAd5d9jW5uu
         ry0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685034035; x=1687626035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHrTsqL0nqeqxBvVw7n3mE3d9UFJpL2j8If6jZFByTc=;
        b=j1STQA7mRqy2pRiwo9CtGQ/w4fvIw0ujWK0+1I3/ngKmwTsC2/ZHk9F1zcA9oKGDkA
         0nWDh21zxkMLZBsXODDC1ltEMoJaa1VR/Uf41EEOJyTIdyvRKsRX6OH8m6fKysmN7O1k
         TTr6obthQRa5xxY/VFsBWPpdOsJbI55PYDeEB+WdiAnBsUyhPFCpyw3PtQs447IjgxjZ
         otUm/SbTH2RHGpA75hyFHqAGgOeicO/i89pk7ZBxenYnRR+2f7VDLkMVNEm3DMx3Isnu
         Ba7vWvDztLd4qJ0AkGLsCzuZ+SqkbAsYcSRdXh0+dMPm+FWZGE8tjSi8wpamd3b1mfTE
         uACw==
X-Gm-Message-State: AC+VfDyaKiV7OQSXSt84PbxhyY0/a1S/HcSB2dKPzSzYI6I//ALIGV1Z
	knDyVHCtOt71Ryom13dnd6nCBAZ0Et7ndh8YlgU=
X-Google-Smtp-Source: ACHHUZ47ymCJWriUjad8DQ05hIMcCKin/PTMMU7nNv3HHwEyV9e0xB3DhHdcf1Fkkg8cgW7lAUtL7p6ayG4dp+Ur5MI=
X-Received: by 2002:a25:2487:0:b0:ba8:5ded:13f3 with SMTP id
 k129-20020a252487000000b00ba85ded13f3mr4152229ybk.17.1685034034679; Thu, 25
 May 2023 10:00:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-2-vishal.moola@gmail.com> <20230525085555.GV4967@kernel.org>
In-Reply-To: <20230525085555.GV4967@kernel.org>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 25 May 2023 10:00:23 -0700
Message-ID: <CAOzc2pxx489C26NnS9NHkUQY9PYiagzt-nYK6LnkJ1N3NYQWzg@mail.gmail.com>
Subject: Re: [PATCH v2 01/34] mm: Add PAGE_TYPE_OP folio functions
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 1:56=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> Hi,
>
> On Mon, May 01, 2023 at 12:27:56PM -0700, Vishal Moola (Oracle) wrote:
> > No folio equivalents for page type operations have been defined, so
> > define them for later folio conversions.
>
> Can you please elaborate why would we need folios for page table descript=
ors?

Thanks for the review!

These macros are for callers that care about the page type, i.e. Table and
Buddy. Aside from accounting for those cases, the page tables don't use fol=
ios.
These are more for the cleanliness of those callers.
