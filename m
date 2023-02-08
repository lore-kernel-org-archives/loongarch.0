Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B632B37B
	for <loongarch@lists.linux.dev>; Wed,  8 Feb 2023 02:10:04 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id o20so25082420lfk.5
        for <loongarch@lists.linux.dev>; Tue, 07 Feb 2023 18:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bZ6NoWzJpDakiHcogI6scQ8ESAgcqrMD04j+O8pqNzk=;
        b=UEAfx2BSvPPcHMDrAR5sjatHfl/nTvivvrky/LNkDVB33PlZbL92I1siXTEs1W11t8
         vYiu/6g5Z7esCEiWXAtfeLrmdL+YVnWMHdv4z3xTKcB7116TClxvvMvbPicEuLMfrePw
         RsvTkQ2F8+HXPKmq4iieEeDNswvqJ6NIJvK0OgPIPQN3KLwVWV3T7qxshaxIOWqYDm5J
         eb5x1PLH6AG3uT0ij5zhsD9e4iO2EKmiEhEfBQdtDRngBXb+Eou54bq1lZ5scfNDKHuZ
         cToW8aj62c7cJMGrnlHEYbRclo2Ead9etynJqggpiCvKewyDLii8YHke4QmhOyhb3pJY
         ueKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZ6NoWzJpDakiHcogI6scQ8ESAgcqrMD04j+O8pqNzk=;
        b=PHeiA51XCUaSRTzPQmv10WifJAojVAyN4Hg2pATvYETw3ZkoeuCK5DJB0ROQGX5O8C
         BvczD+2Cy4l2Qvfht19OfH41GVGhoj0FQ3zOmVTc+LGAqJYc1wh2AMZYGc2XNrUnIDvU
         8GuBPlj+Dnnyl9osJtazFsPHFyrWif18SK9K0D9jNxt796ZS9iUm+CIXr2IGxwXNmpc9
         ubGEemgBWEZ9lf+6z0fKrNah5UjKft8Jw2AoDuzKqrLq3Zj2JyKmNzPGAHByb7RsfqwI
         nFWOmR1jA8qv9Qk/XOhQ4l9uqBPyafDOG9HBPKbFW2y0tNNNvzNR1LitOugCePcNd14q
         n/Sw==
X-Gm-Message-State: AO0yUKVYB349t83MIRArzoqbCsAIm48LA8aYKHYW3DIZQGRS4PML/CkH
	fEtx0eUi/T9q9tep+nZFWEP7fZ2+Y5yWb9Oxhls=
X-Google-Smtp-Source: AK7set92dwlpY4y5jslgDXCD/rZ1nC5QmxGOuitbQxwdvVHuTBWXe1tHOk6ECb9cs7XXmQc+gRWjbL4mv+PV0OGlNaA=
X-Received: by 2002:ac2:4a73:0:b0:4db:d97:224e with SMTP id
 q19-20020ac24a73000000b004db0d97224emr465975lfp.84.1675822202479; Tue, 07 Feb
 2023 18:10:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1675734681.git.chenfeiyang@loongson.cn> <1af05c1441e9f96870be1cc20b1162e3f5043b2e.1675734681.git.chenfeiyang@loongson.cn>
 <1e7da4e7-392d-4a9e-aa95-0599a0c84419@app.fastmail.com>
In-Reply-To: <1e7da4e7-392d-4a9e-aa95-0599a0c84419@app.fastmail.com>
From: Feiyang Chen <chris.chenfeiyang@gmail.com>
Date: Wed, 8 Feb 2023 10:09:48 +0800
Message-ID: <CACWXhK==yVZGZbY+3DUAuxL34=gKwQv20Cw3y1+QKir0D2F3EQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] nolibc: Add statx() support to implement sys_stat()
To: Arnd Bergmann <arnd@arndb.de>
Cc: w@1wt.eu, "Paul E. McKenney" <paulmck@kernel.org>, Feiyang Chen <chenfeiyang@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Feb 2023 at 22:31, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Feb 7, 2023, at 03:09, chris.chenfeiyang@gmail.com wrote:
> > From: Feiyang Chen <chenfeiyang@loongson.cn>
> >
> > Neither __NR_newfstatat nor __NR_stat is defined on new architecture
> > like LoongArch, but we can use statx() to implement sys_stat().
> >
> > Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
>
> This looks nice, it should also help on 32-bit architectures that
> only have stat64 but not newfstatat or stat.
>
> > +#if defined(__NR_newfstatat) || defined(__NR_stat)
> >  static __attribute__((unused))
> >  int sys_stat(const char *path, struct stat *buf)
> ...
> > +#else
> > +#error None of __NR_newfstatat, __NR_stat, nor __NR_statx defined,
> > cannot implement sys_stat()
> > +#endif
>
> Given that all architectures implement statx the same way, I wonder
> if we can't just kill off the old function here and always use statx.
>
> That would also allow removing the architecture specific
> sys_stat_struct definitions in all arch-*.h files.
>

Hi, Arnd,

I'd really like to make all architectures use sys_statx() instead
of sys_stat(). I just fear we might get dragged into a long discussion.
Can I send a patch series to do this later?

> > +struct statx_timestamp {
> > +     __s64   tv_sec;
> > +     __u32   tv_nsec;
> > +     __s32   __reserved;
> > +};
> > +
> > +struct statx {
> > +     /* 0x00 */
> > +     __u32   stx_mask;       /* What results were written [uncond] */
> > +     __u32   stx_blksize;    /* Preferred general I/O size [uncond] */
> > +     __u64   stx_attributes; /* Flags conveying information about the file
> > [uncond] */
> > +     /* 0x10 */
> > +     __u32   stx_nlink;      /* Number of hard links */
> > +     __u32   stx_uid;        /* User ID of owner */
> > +     __u32   stx_gid;        /* Group ID of owner */
> > +     __u16   stx_mode;       /* File mode */
> > +     __u16   __spare0[1];
> > +     /* 0x20 */
> > +     __u64   stx_ino;        /* Inode number */
> > +     __u64   stx_size;       /* File size */
> > +     __u64   stx_blocks;     /* Number of 512-byte blocks allocated */
> > +     __u64   stx_attributes_mask; /* Mask to show what's supported in
> > stx_attributes */
> > +     /* 0x40 */
> > +     struct statx_timestamp  stx_atime;      /* Last access time */
> > +     struct statx_timestamp  stx_btime;      /* File creation time */
> > +     struct statx_timestamp  stx_ctime;      /* Last attribute change time */
> > +     struct statx_timestamp  stx_mtime;      /* Last data modification time */
> > +     /* 0x80 */
> > +     __u32   stx_rdev_major; /* Device ID of special file [if bdev/cdev] */
> > +     __u32   stx_rdev_minor;
> > +     __u32   stx_dev_major;  /* ID of device containing file [uncond] */
> > +     __u32   stx_dev_minor;
> > +     /* 0x90 */
> > +     __u64   stx_mnt_id;
> > +     __u32   stx_dio_mem_align;      /* Memory buffer alignment for direct I/O */
> > +     __u32   stx_dio_offset_align;   /* File offset alignment for direct I/O */
> > +     /* 0xa0 */
> > +     __u64   __spare3[12];   /* Spare space for future expansion */
> > +     /* 0x100 */
> > +};
>
> Can't we just #include <linux/stat.h> here to avoid having to maintain
> a duplicate copy?
>

Yes, I will #include <linux/stat.h> here.

Thanks,
Feiyang

>     Arnd
