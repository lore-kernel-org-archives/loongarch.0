Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFAB3DBD7E
	for <loongarch@lists.linux.dev>; Thu,  5 Mar 2026 17:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772731648; cv=pass; b=GYKuyLlTTrlrn6hfgmH0UsyGQZyj4VQsUqttsX2eslqYrlFqnc9jILzko149g+AwKAvQjprSiBaJP6lQJCV+LxlSmVzS0qEGD8IEednIW9ZcXtwHx2e/+0cyEXgXQzpgaWYQciszQPMnJPRqRXcDTUxwVjTI0r5Ol3YCNa0oLmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772731648; c=relaxed/simple;
	bh=9xcoW1uuOqJuCGhLK0+3X+GsY8ZmUZ0iw8x7VjTHzj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=po7dnPOYQUDl24TJsKT+Te8DGJjbfhjDIlO5d++PGCs/b8uvd+omkMd8eGrPQnd50dO0Y6LqzTaNZh7nmj3EexG9WO+tYY3pbD5VqNgMna3F0YpWsFgGkPIvwBWEbYa4FFEFe175idjs0BVqkPLSWC8Lx3ggICspKYoK/XXitFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FgGSxSio; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FgGSxSio"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3870df2331aso69217981fa.1
        for <loongarch@lists.linux.dev>; Thu, 05 Mar 2026 09:27:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772731646; cv=none;
        d=google.com; s=arc-20240605;
        b=K+wytpE3hslsrmQ0Gv9IeSPXwcAtPsA/zrCfznv9wOsUUAJ+KXNSAN0PrsLKhqz7ri
         y1UZmrzzKeAG2wIhAFwArDvFbRMxvleuV4FwGJ0RNTdTDwmPgHn3V2s5cphgVvmobF30
         5qh83XLKKAM+Z5znRb2dlN/EQiKMFx+z6k9TZlnSOJ7PN7rXiRJZpybdttOrpScJ+YWm
         MNWec4YvdFcIy+HZqFRTcLJj0n59KPchrPJ+bLtQ+xRPgExeQZ/QUb4MF5msQCJjT0F4
         Yj2d5t8uSCbyMnyOsqg42IgC9Dl/XABFwGwCf9RWj4rf1soCgVINFs0SxC+ZbDm257p9
         r0Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9xcoW1uuOqJuCGhLK0+3X+GsY8ZmUZ0iw8x7VjTHzj4=;
        fh=rdKialxA9+75XaSv+YKeve21HbZMHDI2WIJKsoPZ49I=;
        b=fgc29yAWrhISh/4hNPcH5FnNNPCozU/4HgEScRnqZtXcR8jtUcV8pbDN8Piss62Tzj
         EpEc3XmajSRZiEzUrm5wdYkuAXBZ6f9GI/D/clB6GtAl+BIEqeqhD6WUdu1fFF1ZPKya
         2tioGcXPJdxZrYV8EyAGdcSNGct5UeBjUClRH5DWub2i4VPgXaUQxyehhSI3MAlWSmdB
         eD5hPQz4Oh9TNsIfprhgqqtYKWrS3L2be6C1e6VzJ9StBTyNSGXYgpP4sZnuRpS2enFM
         kKBQn5LTj2RazyolrcksyL4qyeAuStV9EyeR0CChbYKnY2q6r9pLPv6ectjyh35sz4PQ
         HRiA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772731646; x=1773336446; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xcoW1uuOqJuCGhLK0+3X+GsY8ZmUZ0iw8x7VjTHzj4=;
        b=FgGSxSioHSGBCB2Y3UHDg4eLGv0j7nnkKFSO100nQqEKYJQITkiclTj20shr3nULab
         lBk+gcbn+PzeEI7wOGKCWwJj8X4EtFq5Wz7bSB6onqiWlZynycUe8tUgwEp7GMRfzXjV
         KHhdRMknVNfxf7Q5AJvd84dyhrKjrofjJOwdAXe7Xq2L/XIgr0ltrlT/8rlWTiOp86gT
         hNw5xhDkefhSlKJD1w+HkRpg7SZP/cQx6TH1E/EUA+7Vimw2N4CAGmZDrUToxXKXspYv
         Q/q0KF68Cr9b++D5leEOPEi2YRRRzmMBipTdimN7gcpWWiB6Dx/1nreL/OX9RXmGYQGC
         49Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731646; x=1773336446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9xcoW1uuOqJuCGhLK0+3X+GsY8ZmUZ0iw8x7VjTHzj4=;
        b=pxTsmZ9MuS2X9s4s3pw7piHKX7MjskCXtLBOWtrNrn5K4AVNIyQLqNdPe+nsuFQUNM
         ikqeeMmHZ65HqoNjAytkKfMaTgQlX70YeJzPUWh7HmyZ59ZK+vVZUptPQ16c7ehNypk9
         tITqcGpaZhlK0IIlAzF6jQGuWG1MFVjyGBprlC5RxiSbFhhp3uTkt848a2Dm3LKPOKsJ
         rLXY1oLYfLtzdMJd3A2huAnZxdIEdnGjteuL2gqComm/LeycL0GsrnL7NA7afDibvqhU
         cDHJOdr8TfXuqHuPM5vCw6VxjHWs/X+ileZRawxqTHz64sQ4TS9jeoYQ/FzLUXo118+v
         1Eow==
X-Forwarded-Encrypted: i=1; AJvYcCW7trOmARBiMq6R1/kk63PjPOdWxeBJjN9iXqCbld1CBpSwgnVocsGGN8L8Zel4Fx/rQDoVm9hwcLw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxA/ACDcpsKwhZm0fWmdjVOD3AHTnO32aSKuO0r+csbz+e/msXo
	eerM9xdditDW3RGzfigE+VW4uFXlJNqjuR6iybPPhrpnWJ3LdT4IZwKqQgY7AD2+oeohM9Kighl
	na11vlvlpUbJeRdgW8X8N0DWDaqmZsx5c3KXTOzF+
X-Gm-Gg: ATEYQzwRzms31+YTrnDLrZTmuO/DQwKLTn/nWhq73Chvyh/hcLKZ5iadDLyirLmZo5U
	0Fy/GYem9ADRaSfcAmHv4dUf//6hFj9Z3GkGPNiek45UPmbnMx9mVnBY6VqyX1wEasHoG8sdF+A
	88v11I+EFbOYSVEdMLI87SZx3iEslzvgyWMd0Xp52WJCebUAqL9LGA91b5bx8ZOQpF8Rh0B0o9l
	tWRhEF13OGvmFKRXXvtA1nRo/8f1Z17CehDT6nu/Gi7mfnOAkMPhVDwmrELJClj/Dd9sZZ0j7Bz
	IxumrbJV
X-Received: by 2002:a2e:9797:0:b0:387:5ea:e298 with SMTP id
 38308e7fff4ca-38a35158513mr8005261fa.8.1772731645158; Thu, 05 Mar 2026
 09:27:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com> <20260220004223.4168331-5-dmatlack@google.com>
 <aam7JsCyQ5Oacvl5@google.com>
In-Reply-To: <aam7JsCyQ5Oacvl5@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 5 Mar 2026 09:26:57 -0800
X-Gm-Features: AaiRm51o6Q3ZTz6ECMDT5TdlqFdcggDf0j5vT0TJnm45bgTm8VbA0ynEnVZFATE
Message-ID: <CALzav=fV4NX=pxKfX7hH+tO3FBNcSF1KstXsKqprpCj64Ndx2Q@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] KVM: selftests: Use u64 instead of uint64_t
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Bibo Mao <maobibo@loongson.cn>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Colin Ian King <colin.i.king@gmail.com>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 9:19=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Fri, Feb 20, 2026, David Matlack wrote:
> > -static uint64_t pread_uint64(int fd, const char *filename, uint64_t in=
dex)
> > +static u64 pread_uint64(int fd, const char *filename, u64 index)
>
> I think it's also worth converting the function to pread_u64().

Good eye :). Yes agreed.
